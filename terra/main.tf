# main.tf

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"  # Default Docker socket
}

resource "docker_container" "example" {
  name  = "example-container"
  image = "nginx:latest"  # Using the Nginx image for the container
  ports {
    internal = 80
    external = 8080
  }
}
