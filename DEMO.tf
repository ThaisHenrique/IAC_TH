provider "oci" {
  region = var.region
}

variable "compartment_ocid" {
  default = "insira o OCID do Compartment onde será criado o bucket"
}
variable "region" {
  default = "insira a região onde o seu Tenancy está criado ex: us-ashburn-1"
}

variable "bucket_name" {
  default = "resource_manager_demo_bucket"
}

data "oci_objectstorage_namespace" "namespace" {
  compartment_id = var.compartment_ocid
}

resource "oci_objectstorage_bucket" "create_bucket" {
    compartment_id = var.compartment_ocid
    name = var.bucket_name
    namespace = data.oci_objectstorage_namespace.namespace.namespace
    access_type = "NoPublicAccess"
}

output "new_bucket" {
    value = oci_objectstorage_bucket.create_bucket
}
