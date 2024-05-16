# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "AWS_PROFILE" {
  description = "AWS profile"
  type        =  string
  default     = "terraform"
}

variable "your_domain_name" {
   type= string
   description= "devopsdennis.com"
   default= "test.devopsdennis.com"
}
