# huggingface-gpt2 project

PREVIEW NOTE: The final `workloads` step is still being debugged.

Based on example [Accelerate GPT2 fine-tuning with ONNX Runtime Training](https://github.com/microsoft/onnxruntime-training-examples/tree/master/huggingface-gpt2)

## Search and replace

What to search and replace in order to reuse this project as the basis for a new one. Search in case-sensitive mode.

- yrn42onnxtraingpt2-prefix -> Common project prefix for containers. Example: abcd
- yrn42onnxtraingpt2-namespace -> Kubernetes namespace for installing containers. Example: abcd
- yrn42onnxtraingpt2-dns -> DNS prefix. Example: abcd
- yrn42onnxtraingpt2-resource-group -> Name for group of resources (Azure). Example: abcd
- yrn42onnxtraingpt2-tags -> Resource tags (Cloud, if template uses it). Example: abcd
- yrn42onnxtraingpt2-domain -> Domain for web email, site, Example: abcd.com
- yrn42onnxtraingpt2-ip-name -> Name for the public IP address. Example: abcd
- yrn42onnxtraingpt2-cluster-name -> Name for the K8S cluster (or at least a common prefix). Example: abcd
- yrn42onnxtraingpt2-sitename -> Name for site in the UX (This will be visible to end users). Example: Abcd

Despite the several placeholders enabling reuse in different configurations, it is recommended to replace as many valuables as possible to become identical, easing future maintenance. Replace `yrn42onnxtraingpt2-domain` first and then use this regular expression to search and replace the others:  `(yrn42onnxtraingpt2)[A-Za-z0-9\-]*`

Before deploying to the cloud environments, seek for `TO-SET` and set the required values. See section "Cloud deployment instructions".

## End to end deployment

Below are the end-to-end steps to deploy the `website` project to `localhost` (assuming Docker is installed and Kubernetes enabled). Execution below is from the `automation` folder. You may need to start PowerShell (`pwsh`).

- Create resources

```shell
./yuruna.ps1 resources ../projects/examples/onnx/training/gpt2 localhost
```

- Build the components

```shell
./yuruna.ps1 components ../projects/examples/onnx/training/gpt2 localhost
```

- Deploy the  workloads

PREVIEW NOTE: This step is still under development. The [`helper`](./workloads/helper/) folder has scripts for each of the phases being integrated and tested.

```shell
./yuruna.ps1 workloads ../projects/examples/onnx/training/gpt2 localhost
```

## Resources

Terraform will be used to create the following resources:

- A Kubernetes cluster

As output, the following values will become available for later steps:

- registryLocation

## Components

- Image `dataload`: based on Linux, with script to download and prepare data.
- Image `tuning`: based on onnxruntime, with steps for model tuning.

## Workloads

- Container `dataload`: loads data into a persistent volume claim. Will be a [init container](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/).
- Container `tuning`: executes the tuning phase.

## Cloud deployment instructions

- Edit the files under `projects/examples/config/azure/` and set the `registryName` to a unique name (search for `TO-SET`). Azure requires a globally unique registry name. Ping `yourname.azurecr.io` and confirm that name is not already in use. This should just be the name (like `yuruna`). Azure automatically adds the domain (`azurecr.io`). Set the same across all the files.
  - The current value is intentionally left empty so that validation will point out the need to edit the files.
- Afterwards, execute the same commands above, replacing `localhost` with `azure`.

Back to main [readme](../../../../../README.md). Back to list of [examples](../../../README.md).
