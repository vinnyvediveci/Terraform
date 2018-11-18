resource "google_compute_instance" "default" {
	name = "${var.name}"
	machine_type = "${var.machine_type}"
	zone = "${var.zone}"
	tags = ["${var.name}"]
	boot_disk {
		initialize_params {
			image = "${var.image}"
		}
	}
	network_interface {
		network = "${var.network}"
		access_config {
			// Ephemeral IP
		}
	}
	metadata {
    	sshKeys = "${var.ssh_user}:${file("~/.ssh/id_rsa.pub")}"
  }	
	connection = {
		type = "ssh"
		user = "${var.ssh_user}"
		private_key = "${file("~/.ssh/id_rsa")}"
	}
	provisioner "remote-exec" {
		inline = [
				 "${var.update_packages}[var.package_manager]}",
				 "${var.install_packages[var.package_manager]} ${join(" ", var.packages)}"
			
		]
	}
	provisioner "remote-exec" {
		scripts = "${var.scripts}"
	}
	
}
