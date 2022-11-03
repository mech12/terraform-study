# 개요
테라폼 상태파일에 민감정보가 어떻게 저장되는지 연습

# 실행 준비
* default vpc, default subnet, default route table, default security group
* 입력변수를 환경변수로 설정
```bash
export TF_VAR_db_username='user'
export TF_VAR_db_password='password'
```

# 실행
* 테라폼 코드를 apply하면 db.t2.micro타입인 RDS 1대가 생성됩니다.
* 약 4분 소요됩니다.
```bash
terraform apply
```

# tfstate파일 관찰
상태파일의 값이 암호화되지 않는 것을 확인
```bash
egrep 'username|password' terraform.tfstate
```

# 삭제
```bash
terraform init; terraform destroy
```
