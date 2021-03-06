# Syntax

The connection between the Yaml configuration files and the actions taken by each command is explained in presentation available in [PowerPoint](yuruna.pptx) and [PDF](yuruna.pdf) formats.

## Parameters

The main PowerShell script named `yuruna` accepts the following parameters:

- `yuruna validate [project_root] [config_subfolder]`: Validate configuration files.
- `yuruna resources [project_root] [config_subfolder]`: Deploys resources using Terraform as helper (`terraform apply` executed in the configured work folder).
- `yuruna components [project_root] [config_subfolder]`: Build and push components to registry.
- `yuruna workloads [project_root] [config_subfolder]`: Deploy workloads using Helm as helper.
- `yuruna clear [project_root] [config_subfolder]`: Clear resources for given configuration (`terraform destroy` executed in the configured work folder).

Coming soon

- `yuruna requirements`: Check if machine has all requirements.

## Notes

- A folder `.yuruna` is create under the `project_root` for the temporary files.

Back to main [readme](../README.md)
