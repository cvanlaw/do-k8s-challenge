dev_path = infra/src/terraform/environments/dev

terraform_init:
	cd $(dev_path) && terraform init -backend-config=backend.hcl

terraform_plan: terraform_init
	cd $(dev_path) && terraform plan -out=tfplan -var repo="github.com/cvanlaw/do-k8s-challenge" -var environment="dev"

terraform_apply: terraform_init terraform_plan
	cd $(dev_path) && terraform apply tfplan

terraform_validate: terraform_init
	cd $(dev_path) && terraform validate

terraform_format_check:
	cd $(dev_path) && terraform fmt -recursive -check

terraform_format:
	terraform fmt -recursive

terraform_ci: terraform_format_check terraform_validate terraform_plan

terraform_clean:
	cd $(dev_path) && rm -r .terraform
