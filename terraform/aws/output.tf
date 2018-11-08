output "kubeone_api" {
  value = {
    endpoint = "${aws_lb.control_plane.dns_name}"
  }
}

output "kubeone_hosts" {
  value = {
    control_plane = {
      public_address  = "${aws_instance.control_plane.*.public_ip}"
      private_address = "${aws_instance.control_plane.*.private_ip}"
      ssh_user        = "ubuntu"
      ssh_port        = "${var.ssh_port}"

      ssh_agent_socket     = "${var.ssh_agent_socket}"
      ssh_private_key_file = "${var.ssh_private_key_file}"
    }
  }
}