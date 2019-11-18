# Oracle Cloud Provider | main.tf

# Configure the Oracle Cloud Infrastructure provider with an API Key
provider "oci" {
  tenancy_ocid = "${var.oci_tenancy}"
  user_ocid = "${var.oci_user}"
  fingerprint = "${var.oci_fingerprint}"
  private_key_path = "${var.oci_key}"
  region = "${var.oci_region}"
}

# Get a list of Availability Domains
data "oci_identity_availability_domains" "ads" {
  compartment_id = "${var.oci_tenancy}"
}

# Output the result
output "show-ads" {
  value = "${data.oci_identity_availability_domains.ads.availability_domains}"
}
