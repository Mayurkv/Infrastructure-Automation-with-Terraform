variable "resource_name" {
    type = string
    description = "All the resources should start with this name"
    default = "mayur-project"
}

variable "location" {
    type = string
    description = "Location for the resources"
    default = "centralus"
}