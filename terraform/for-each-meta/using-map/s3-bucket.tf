resource "aws_s3_bucket" "my-bucket" {
    for_each = {
      dev = "my-dapp-bucket"
      test = "my-tapp-bucket"
      qa = "my-qapp-bucket"
 
    }
  
  bucket = "${each.key}-${each.key}"
  aws_s3_bucket_acl = "private"

  tags = {
    environment = each.key
    bucketname = "${each.key}-${each.value}"
    eachvalue = each.value
  }
}