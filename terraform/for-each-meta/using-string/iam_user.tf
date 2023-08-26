resource "aws_iam_user" "my-users" {

  for_each = toset(["TJack","TMadhu"])
  name = each.key

}