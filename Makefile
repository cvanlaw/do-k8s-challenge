dev_path = infra/src/terraform/environments/dev

terraform_init:
	cd $(dev_path) && terraform init -backend-config=backend.hcl

terraform_plan: terraform_init
	cd $(dev_path) && terraform plan -out=tfplan

terraform_apply: terraform_init terraform_plan
	cd $(dev_path) && terraform apply tfplan

terraform_validate: terraform_init
	cd $(dev_path) && terraform validate

terraform_format:
	cd $(dev_path) && terraform fmt -recursive -check

terraform_ci: terraform_format terraform_validate

terraform_clean:
	cd $(dev_path) && rm -r .terraform
