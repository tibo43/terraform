iam_s3 = {
  private = {
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
    team                    = "devops"
    product                 = "tools"
    environment             = "production"
    department              = "tech"
  }
  public = {
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
    team                    = "devops"
    product                 = "tools"
    environment             = "production"
    department              = "tech"
  }
}
