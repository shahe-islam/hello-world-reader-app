data "template_file" "hello_world_app" {
  template = "${file("app.tpl")}"
  vars = {
    ENV_KEY = "HELLOWORLD"
  }
}


resource "local_file" "hello_world_app" {
  content  = data.template_file.hello_world_app.rendered
  filename = "${path.cwd}/../hello_world_reader_app.py"
}