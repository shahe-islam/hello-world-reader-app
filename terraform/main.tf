data "template_file" "hello_world_reader_app" {
  template = "${file("app.tpl")}"
  vars = {
    ENV_KEY = "TEST"
  }
}


resource "local_file" "hello_world_reader_app" {
  content  = data.template_file.hello_world_reader_app.rendered
  filename = "${path.cwd}/../hello_world_reader_app.py"
}