# 테라폼 코드에서 민감정보가 노출될 수 있는 부분
* 테라폼 코드
  * provider
  * 리소스 민감정보(DB ID/PW)
  * 백엔드 저장소
* 상태파일
* plan파일

# cloudtrail로 이벤트(ec2 생성 등)를 감지하여 slack에 알림 전송
* event -> eventbridge -> sns -> lmabda -> slack webhook

# 테라폼 코드에서 자격증명을 data block으로 가져오기
```hcl
data "aws_caller_identity" "self" {}
```

# aws kms를 이용한 테라폼 민감정보 암호화/복호화 관리
* cmk생성
* python으로 kms연동 테스트
* 테라폼 연동
  * 먼저 암호화 한 데이터 준비(base64가 필요한가?)
  * 테라폼 코드에서 복호화 진행
  * 복호화 한 데이터를 그대로 사용
* cmk키 삭제시 바로 삭제가 안되고 7일 뒤 삭제

# aws secret manager 연동예제