# deploying static website on s3 bucket 

# Summary
* resource "aws_s3_bucket" "mywebapp-bucket"
* resource "aws_s3_bucket_public_access_block" "example"
* resource "aws_s3_bucket_policy" "mywebapp"
* resource "aws_s3_bucket_website_configuration" "mywebapp"
* resource "aws_s3_object" "index_html"
* resource "aws_s3_object" "styles_css"
* output "name"