# 모니터링
```sh
while true; do aws ec2 describe-instances --query "Reservations[*].Instances[*].{PublicIPAdd:PublicIpAddress,InstanceName:Tags[?Key=='Name']|[0].Value,Status:State.Name}" --filters Name=instance-state-name,Values=running --output text ; echo "------------------------------" ; sleep 1; done
```

# 리소스가 재생성 되는 시점
* 리소스 속성에 따라 다름
* ec2 user data를 변경하면 기존 인스턴스가 삭제되고 새로운 인스턴스가 생성됨

# tf state
* 현재 배포된 상태를 state로 저장
```sh
# 상태 확인
terraform state list

# 상태 상세보기
terraform state show {state 이름}
```

# 변수
* terraform 리소스에서는 var.변수명 으로 참조가능
* 내부에서는 interpolation(보간)으로 참조
