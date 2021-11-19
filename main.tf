resource "aws_s3_bucket" "remote_s3" {
    bucket = "s3-backend-bucket-aaaaa-11111"
	
	versioning {
		enabled = true 
	}
	
	server_side_encryption_configuration {
		rule {
				apply_server_side_encryption_by_default {
					sse_algorithm = "AES256"
				}
		}
	}

	lifecycle {
	      prevent_destroy = true
	}
}

resource "aws_dynamodb_table" "backend_lock" {
	hash_key = "LockID"
	name = "my_dynamodb_tabel_backend"
	billing_mode = "PAY_PER_REQUEST"
	attribute {
		name = "LockID"
		type = "S"
	}
}	
