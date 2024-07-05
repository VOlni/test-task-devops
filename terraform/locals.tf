locals {
  user_data = templatefile("./scripts/user-data.sh.tftpl", {
    owner_name  = "Owner",
    owner_group = "Admin",
    host_tags   = ["Webserver", "QA", "NestJS", "Destroyable", "With Elastic IP"]
  })
}