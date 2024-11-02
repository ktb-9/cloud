# ansible-playbook yml 별로 파일 설명


### Ansible 구조
```
ansible/
├── README.md
├── ansible.cfg
├── gen_hosts.sh
├── hosts.ini
├── playbook.yml
├── roles
│   ├── common
│   │   └── tasks
│   │       ├── config.yml
│   │       └── install_pkg.yml
│   ├── argocd
│   │   └── tasks
│   │       ├── ingress.yaml
│   │       └── install.yml
│   └── aws
│       ├── tasks
│       │   └── lbc.yml
│       └── vars
│           └── aws_vars.yml
└── secrets.yml

```

## 설치 방법
### Ansible 설치
1. Ansible 설치:
    ```sh
    brew install ansible
    ```

2. 설치 확인:
    ```sh
    ansible --version
    ```
## 파일 생성 및 실행 방법 (파일 위치는 상단 구조 참고)
### hosts.ini 생성하기
```yaml
[all]
	eks_instance ansible_host=<INSTANCE_IP> ansible_user=<SSH_USER>
```

### secrets.yml 생성하기
```yaml
private_key_file: "<키 파일 경로>"
```

### Ansible 실행
```
ansible-playbook playbook.yml
```
