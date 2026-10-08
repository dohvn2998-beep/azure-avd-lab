# Azure AVD Career Lab

A low-cost GitOps-style Azure lab for Terraform, Azure Virtual Desktop, golden images, GitHub Actions, OIDC, Azure Automation, monitoring, versioning, rollback, and recovery.

## Principles

1. Start with the smallest Azure footprint.
2. Keep infrastructure definitions in Git.
3. Never commit passwords, client secrets, certificates, or Terraform state.
4. Review Terraform plans before applying.
5. Use Git tags for known-good lab versions.
6. Keep Terraform state in Azure Storage with blob versioning.
7. Deallocate or destroy compute when the lab is not in use.

## Lab phases

| Phase | Goal | Cost approach |
|---|---|---|
| 1 | Terraform + GitHub + Azure foundation | No VM |
| 2 | Windows administration | One small VM |
| 3 | AVD | One session host |
| 4 | Golden image | Build only when needed |
| 5 | Automation and monitoring | Add only required services |

## Repository layout

- terraform/ - Azure infrastructure
- .github/workflows/ - CI/CD
- scripts/bootstrap/ - one-time Azure bootstrap
- scripts/git/ - release and recovery helpers
- image-builder/ - future Azure Image Builder definitions
- automation/ - future Azure Automation runbooks
- monitoring/ - future KQL and monitoring definitions
- docs/ - procedures and recovery documentation

See docs/01-getting-started.md and docs/09-versioning-and-recovery.md.

This is a learning lab. Review every Terraform plan before applying it.
