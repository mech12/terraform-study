# 개요
* 테라폼 코드 레이아웃(구조) 예제

# 실행준비
* RDS username, password설정
```bash
export TF_VAR_db_username='cloudneta'
export TF_VAR_db_password='cloudnetaQ!'
```

* backend s3생성(s3 bucket이름 수정필요)
```bash
cd global
terraform init; terraform apply
```

# 실행
```bash
cd dev
terraform init; terraform apply
```

# 실행 확인
* alb를 호출하여 부하분산이 잘 되는지 확인
```bash
cd dev

ALBDNS=$(terraform output -raw myalb_dns)
for i in {1..100}; do curl -s http://$ALBDNS:8080/ ; done | sort | uniq -c | sort -nr
```

# 삭제
```bash
cd dev
terraform destroy

cd ../global
terraform destroy
```