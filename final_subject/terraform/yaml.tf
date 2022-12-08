data "kubectl_file_documents" "nginx_ingress" {
  content = file("yaml/ingress-nginx.yaml")
}

resource "kubectl_manifest" "nginx_ingress" {
  for_each  = data.kubectl_file_documents.nginx_ingress.manifests
  yaml_body = each.value
}
