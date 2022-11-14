# list
```shell
$ terraform console
[for item in data.aws_subnets.default.ids: item]
```

# map
* tag에 사용하면 좋다.

```shell
$ terraform console
> local.map
> type(local.map)
> {for k,v in local.map : v => k }
```


# 참고자료
* https://dev.to/mediocredevops/ease-your-tf-debugging-using-terraform-console-5fbm/
* https://registry.terraform.io/providers/hashicorp/aws/3.4.0/docs/resources/default_subnet/
* https://developer.hashicorp.com/
* https://www.cobalt.io/blog/terraform-the-less-common-commands-and-options
* https://www.techtarget.com/searchitoperations/tutorial/Walk-through-common-use-cases-for-built-in-Terraform-functions
