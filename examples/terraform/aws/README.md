# AWS Quickstart Terraform scripts

The AWS Quickstart Terraform scripts can be used to create the needed infrastructure for a Kubernetes HA cluster.
Check out the following [AWS getting started walkthrough][aws-quickstart] to learn more about how to use the
scripts and how to provision a Kubernetes cluster using KubeOne.

[aws-quickstart]: https://github.com/kubermatic/kubeone/blob/master/docs/quickstart-aws.md

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.10 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | AMI ID, use it to fixate control-plane AMI in order to avoid force-recreation it at later times | `string` | `""` | no |
| aws\_region | AWS region to speak to | `string` | `"eu-west-3"` | no |
| bastion\_port | Bastion SSH port | `number` | `22` | no |
| bastion\_user | Bastion SSH username | `string` | `"ubuntu"` | no |
| cluster\_name | Name of the cluster | `any` | n/a | yes |
| control\_plane\_type | AWS instance type | `string` | `"t3.medium"` | no |
| control\_plane\_volume\_size | Size of the EBS volume, in Gb | `number` | `100` | no |
| initial\_machinedeployment\_replicas | number of replicas per MachineDeployment | `number` | `1` | no |
| internal\_api\_lb | make kubernetes API loadbalancer internal (reachible only from inside the VPC) | `bool` | `false` | no |
| open\_nodeports | open NodePorts flag | `bool` | `false` | no |
| ssh\_agent\_socket | SSH Agent socket, default to grab from $SSH\_AUTH\_SOCK | `string` | `"env:SSH_AUTH_SOCK"` | no |
| ssh\_port | SSH port to be used to provision instances | `number` | `22` | no |
| ssh\_private\_key\_file | SSH private key file used to access instances | `string` | `""` | no |
| ssh\_public\_key\_file | SSH public key file | `string` | `"~/.ssh/id_rsa.pub"` | no |
| ssh\_username | SSH user, used only in output | `string` | `"ubuntu"` | no |
| subnets\_cidr | CIDR mask bits per subnet | `number` | `24` | no |
| vpc\_id | VPC to use ('default' for default VPC) | `string` | `"default"` | no |
| worker\_os | OS to run on worker machines | `string` | `"ubuntu"` | no |
| worker\_type | instance type for workers | `string` | `"t3.medium"` | no |

## Outputs

| Name | Description |
|------|-------------|
| kubeone\_api | kube-apiserver LB endpoint |
| kubeone\_hosts | Control plane endpoints to SSH to |
| kubeone\_workers | Workers definitions, that will be transformed into MachineDeployment object |

