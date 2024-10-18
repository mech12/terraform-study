resource "aws_key_pair" "demo" {  // aws_key_pair 리소스 생성
  key_name   = "demo"             // key_name은 demo로 설정
  public_key = file("./demo.pub") // demo.pub 파일을 읽어서 public_key로 사용
}

data "aws_ami" "amazon-linux-2" { // aws_ami 데이터 소스 생성
  most_recent = true              // 가장 최근의 AMI를 가져옴

  filter {                 // 필터 설정
    name   = "owner-alias" // 소유자 별칭
    values = ["amazon"]    // 소유자 별칭이 amazon인 AMI만 가져옴
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  owners = ["amazon"] // AMI 소유자가 amazon인 AMI만 가져옴
}

resource "aws_instance" "example" {
  ami                    = data.aws_ami.amazon-linux-2.id
  instance_type          = "t2.nano"
  key_name               = aws_key_pair.demo.key_name
  vpc_security_group_ids = [aws_security_group.stg_mysg.id]

  iam_instance_profile = aws_iam_instance_profile.instance.name
}

resource "aws_iam_role" "instance" {
  name_prefix        = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"] // AssumeRole 권한을 부여. 
    // AssumeRole은 다른 AWS 서비스가 이 역할을 가지고 다른 역할을 가지고 다른 AWS 서비스에 대한 액세스를 요청할 수 있도록 함

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "example" {
  role   = aws_iam_role.instance.id
  policy = data.aws_iam_policy_document.ec2_admin_permissions.json
}

data "aws_iam_policy_document" "ec2_admin_permissions" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:*"]
    resources = ["*"]
  }

  statement {
    sid = "1" # Statement ID : 정책 문서 내에서 고유한 식별자

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {
    actions = [
      "s3:List*",
      "s3:Get*",
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_name}",
      "arn:aws:s3:::${var.bucket_name}/*",
    ]
  }
}

resource "aws_iam_instance_profile" "instance" {
  role = aws_iam_role.instance.name
}
