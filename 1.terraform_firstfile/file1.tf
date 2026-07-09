resource "local_file" "file_name"{
    filename = "automated.txt"
    content = "this file was created using terraform"
}