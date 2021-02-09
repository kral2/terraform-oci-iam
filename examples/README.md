# Create Compartment, Sub-compartment, Users, Group and Dynamic Group

This example shows how to create a compartement with two sub-compartemnt, and the following resources:

- several users,
- a group with members,
- a policy inside a compartment, defining specific permissions granted to a group,
- some more directives to show dynamic groups and associated policy.

Notes:

- The compartment resource internally resolves name collisions and returns a reference to the preexisting compartment.
All resources created by this example can be deleted by using the `terraform destroy` command.
- When using the oci-iam modules, or more generally when manipulating iam resources, **be sure to configure your oci provider to use the tenancy's home region**, as IAM resources can only be managed from the home region.
- To combine this template with non-iam resources provisioned in a region different from your *home region*, you will need to use [provider aliases](https://www.terraform.io/docs/configuration/providers.html#alias-multiple-provider-configurations).

## How to use this example on the cli

Alternatlively, you can also deploy the configuration in this folder using Terraform cli on your desktop or with [Cloud Shell](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/cloudshellintro.htm)

- Create a "terraform.tfvars" file based on the provided template, "terraform.tfvars.template", and fill in the necessary info.
- Initialize the directory:

```bash
> terraform init
```

- Inspect what Terraform plans to do on the next `apply`:

```bash
> terraform plan
```

- If proposed changes are what is intended, apply the current plan to provision resources on OCI (if not, abort the operation and review the configuration):

```bash
> terraform apply
```

Sample ouput:

```bash
Apply complete! Resources: 11 added, 0 changed, 0 destroyed.

Outputs:

iam_compartment = {
  "description" = "compartment created by terraform"
  "name" = "tf_example_compartment"
  "ocid" = "ocid1.compartment.oc1..aaaaaaaa"
  "parent" = "ocid1.tenancy.oc1..aaaaaaaa"
}
iam_dynamic_group_name = tf_example_dynamic_group
iam_group = [
  {
    "tf_example_group" = "ocid1.group.oc1..aaaaaaaa"
  },
]
iam_subcompartment1 = {
  "description" = "subcompartment created below tf_example_compartment by terraform"
  "name" = "tf_example_subcompartment"
  "ocid" = ""
  "parent" = ""
}
iam_subcompartment2 = {
  "description" = "subcompartment created below tf_example_compartment by terraform"
  "name" = "tf_example_subcompartment2"
  "ocid" = ""
  "parent" = ""
}
iam_users = [
  {
    "tf_example_user1@example.com" = "ocid1.user.oc1..aaaaaaaa"
    "tf_example_user2@example.com" = "ocid1.user.oc1..aaaaaaaa"
    "tf_example_user3@example.com" = "ocid1.user.oc1..aaaaaaaa"
  },
]
```
