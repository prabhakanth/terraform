resource "aws_s3_bucket" "backendbucket" {
    bucket = "remotebackend-with-dynamodb"

}

resource "aws_s3_bucket_versioning" "bucketversioning" {
  bucket = aws_s3_bucket.backendbucket.bucket
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sseconfig" {
    bucket = aws_s3_bucket.backendbucket.bucket
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm     = "AES256"
            }
    }
}   

resource "aws_dynamodb_table" "state-lock" {
    name = "remote-statelocking"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}
