// Copyright (c) 2018, 2021, Oracle and/or its affiliates.

/*
This example shows how to create three users using the iam-user module.
The configuration below is intended to be applied by OCI Resource Manager
*/

variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "region" {}

terraform {
  required_version = ">= 0.12" // this example is intended to run with Terraform v0.12
  required_providers {
    oci = {
      version = ">= 3.27" // force downloading oci-provider compatible with terraform v0.12
    }
  }
}

module "iam_user_tf_example" {
  source          = "oracle-terraform-modules/iam/oci//modules/iam-user"
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

output "iam_user_tf_example" {
  description = "list of username and associated ocid"
  value       = module.iam_user_tf_example.name_ocid
}
