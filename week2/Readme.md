# data BLOCK
인프라에 기존에 있는 것을 테라폼 코드로 연결?

# tf파일 분리
terraform plan, apply명령어를 실행할 때 tf파일 모두 인식

# terraform oupput이 여러개 일때 지정
```sh
terraform output -raw {putput 이름}
```

# 테스트 할 것
* ec2 instance와 security group을 생성한 상태에서, security group을 변경하면 security group이 재생성되는가?
* aws dynamodb strong consistency무엇인지?
* 원격지 상태 upload후 tfsate삭제 후 잘 되는지 확인(terraform 명령어에서 --debug모드가 되는지 !?)