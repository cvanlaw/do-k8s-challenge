terraform_init:
	cd infra/src/terraform && terraform init -backend-config=backend.hcl

terraform_plan: terraform_init
	cd infra/src/terraform && terraform plan -out=tfplan

terraform_apply: terraform_init terraform_plan
	cd infra/src/terraform && terraform apply tfplan

terraform_validate: terraform_init
	cd infra/src/terraform && terraform validate

terraform_format:
	cd infra/src/terraform && terraform fmt -recursive -check