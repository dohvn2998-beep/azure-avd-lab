# Versioning and Recovery

The lab uses two recovery layers.

## Layer 1: Git

Git protects Terraform code, scripts, workflows, and documentation.

Useful commands:

    git log --oneline --decorate --all
    git tag
    git switch --detach v0.1.0
    git switch main

Create a known-good release:

    git add .
    git commit -m "feat: establish known-good lab baseline"
    git tag -a v0.1.0 -m "Known-good lab baseline"
    git push origin main
    git push origin v0.1.0

## Layer 2: Terraform state

Terraform state must live outside Git. Use the AzureRM backend with Azure Storage blob versioning. Never commit state to this repository.

After restoring code to a known-good tag, run terraform init and terraform plan before any apply.

If state is damaged, inspect Azure Storage blob versions and restore the appropriate prior version. Do not manually edit state unless you fully understand the consequences.

## Intentional recovery exercise

1. Deploy a tiny resource.
2. Tag the working state.
3. Make a controlled Terraform change.
4. Commit it.
5. Review the plan.
6. Revert the Git commit.
7. Run another plan.
8. Confirm Terraform proposes the expected correction.

Git restores desired configuration; Terraform state represents infrastructure state. Never run a blind terraform apply after rollback.
