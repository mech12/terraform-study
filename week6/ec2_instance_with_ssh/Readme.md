# 개요
* aws ami EC2 Instance 실행

# 준비
* ssh 키쌍 생성
```sh
ssh-keygen -t rsa -b 4096 -f demo
```

# 실행
* 약 1분 소요
```sh
terraform init
terraform apply
```

# 참고자료
* https://www.letscloud.io/community/how-to-install-jenkins-on-ubuntu-2004
* https://medium.com/@raguyazhin/install-jenkins-on-amazon-linux-ec2-instance-using-terraform-1a6bc35bacaa


ssh -i demo ec2-user@<public ip>


# 임시 자격증명은 EC2 Instance metadata에서 확인가능.

IAMROLE=$(curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials)
curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/$IAMROLE