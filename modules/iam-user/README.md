# modules/iam-user

This [Terraform module](https://www.terraform.io/docs/modules/index.html) creates a list of [Oracle Cloud Infrastructure  IAM users](https://docs.cloud.oracle.com/iaas/Content/Identity/Tasks/managingusers.htm). Fedetated users are currently not supported by this module.

In its current version, the module is limited to create each user with a description (required) and an e-mail (optional). Future versions of the module may support more parameters (API Keys, Tokens, Secret Keys, etc... ).

Below is the typical module block you should add to your configuration to create a list of users with this module, but the simplest way to deploy this configuration on your tenancy is to use [Resource Manager](https://docs.oracle.com/en-us/iaas/Content/ResourceManager/Concepts/resourcemanager.htm).

<!--[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/oracle-terraform-modules/terraform-oci-iam/raw/master/examples/iam-user/module_iam_user_tf_example.zip)-->

[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/kral2/terraform-oci-iam/raw/add-rm-magic-button/examples/iam-user/module_iam_user_tf_example.zip)

**IMPORTANT:** There is no version pinning of modules in the example code of this module: this is to simplify the documentation process when releasing a new versions. But in production, it is a good practice to pin the module version to the exact version you are using in your code so that your infrastructure remains stable and predictible.

```hcl
module "iam_user_tf_example" {
  source          = "oracle-terraform-modules/iam/oci//modules/iam-user"
  # Pinning each module to a specific version is highly advisable. Please adjust and uncomment the line below
  # version               = "x.x.x"
  tenancy_ocid    = var.tenancy_ocid # required
  users           = [ # a list of users
    { # user1
      name        = "tf_example_user1@example.com" # required
      description = "user1 - terraformed" # required
      email       = null # set to null if you don't want to provide an email 
    },
    { # user2
      name        = "tf_example_user2@example.com"
      description = "user2 - terraformed"
      email       = "tf_example_user2@example.com"
    },
    { # user3
      name        = "tf_example_user3@example.com"
      description = "user3 - terraformed"
      email       = "tf_example_user3@example.com"
    },# add more users below as needed
  ]
}
```

Check out the [examples](https://github.com/oracle-terraform-modules/terraform-oci-iam/tree/master/examples) folder for more complete and fully-functional sample code.

Note the following parameters for the module:

Argument | Description | Default
--- | --- | ---
tenancy_ocid | (Required) Unique identifier (OCID) of the tenancy. Users may only be created at the root of the tenancy. | null
users | (Required) A list of users to create | null

Each User element is a map with up to three keys:

Argument | Description | Default
--- | --- | ---
name | (Required) The name you assign to the user during creation. The name must be unique across all users in the tenancy and cannot be changed. | null
description | (Required)(Updatable) Description you assign to the user during creation. Does not have to be unique, and it's changeable. | null
email | (Required)(Updatable) The email address you assign to the user during creation. Has to be unique across the tenancy. Set it to null if you don't want to provide an email. | null
