**중요: AWS CLI 구성과 terraform.tfvars 파일 생성이 필요합니다.**

### AWS CLI 구성
```sh
aws configure --profile ktb-9
```
프롬프트에 따라 AWS Access Key, Secret Access Key, 리전 및 출력 형식을 입력합니다.

### terraform.tfvars 생성하기 (파일 위치는 하단 구조 참고)
```yaml
db_username = "DB 유저네임"
db_password = "DB 패스워드"
   ```

### terraform 실행하기 (terraform.tfvars 생성했을 경우)
```sh
terraform apply -var-file="terraform.tfvars"
```

---
### Terraform 구조
```
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── terraform.tfstate
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── security_groups/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── iam_roles/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── eks/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```


## 설치 및 실행 방법
### Terraform 설치
1. Homebrew를 사용하여 Terraform 설치:
    ```sh
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform
    ```

2. 설치 확인:
    ```sh
    terraform -v
    ```

### AWS CLI 설치
1. Homebrew를 사용하여 AWS CLI 설치:
    ```sh
    brew install awscli
    ```

2. 설치 확인:
    ```sh
    aws --version
    ```

3. AWS CLI 구성:
    ```sh
    aws configure --profile ktb-9
    ```
   프롬프트에 따라 AWS Access Key, Secret Access Key, 리전 및 출력 형식을 입력합니다.
   ```sh
   AWS Access Key ID [None]: <액세스 키>
   AWS Secret Access Key [None]: <비밀 액세스 키>
   Default region name [None]: ap-northeast-2
   Default output format [None]: json
   ```

### terraform.tfvars 생성하기
```yaml
db_username = "DB 유저네임"
db_password = "DB 패스워드"
```

### Terraform 초기화 및 실행
1. Terraform 초기화:
    ```sh
    terraform init
    ```

2. 구성 검증:
    ```sh
    terraform validate
    ```

3. 인프라 변경 계획:
    ```sh
    terraform plan
    ```

4. 인프라 변경 적용:
    ```sh
    terraform apply
    ```
* 만약 terraform.tfvars 생성했다면
    ```sh
    terraform apply -var-file="terraform.tfvars"
    ```