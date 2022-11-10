resource "local_file" "example" {
  content  = var.content
  filename = "${path.root}/foo.bar"
}