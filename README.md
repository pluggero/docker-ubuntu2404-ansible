# Ubuntu 24.04 LTS (Noble Numbat) Ansible Test Image

[![Build](https://github.com/pluggero/docker-ubuntu2404-ansible/actions/workflows/build.yml/badge.svg)](https://github.com/pluggero/docker-ubuntu2404-ansible/actions/workflows/build.yml) [![Docker pulls](https://img.shields.io/docker/pulls/pluggero/docker-ubuntu2404-ansible.svg?maxAge=2592000)](https://hub.docker.com/r/pluggero/docker-ubuntu2404-ansible/)

Rocky Linux 9 Docker container for Ansible playbook and role testing.

## Tags

- `latest`: Latest stable version of Ansible, with Python 3.x.

## How to Build

This image is built on Docker Hub automatically any time the upstream OS container is rebuilt, and any time a commit is made or merged to the `main` branch. But if you need to build the image on your own locally, do the following:

1. [Install Docker](https://docs.docker.com/engine/installation/).
2. `cd` into this directory.
3. Run `docker build -t docker-ubuntu2404-ansible .`

## How to Use

1. [Install Docker](https://docs.docker.com/engine/installation/).
2. Pull this image from Docker Hub: `docker pull pluggero/docker-ubuntu2404-ansible:latest` (or use the image you built earlier, e.g. `docker-ubuntu2404-ansible:latest`).
3. Run a container from the image: `docker run --name test-container -d --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:rw --cgroupns=host pluggero/docker-ubuntu2404-ansible:latest` (to test my Ansible roles, I add in a volume mounted from the current working directory with ``--volume=`pwd`:/etc/ansible/roles/role_under_test:ro``).
   - **NOTE**: It should be avoided to mount your workstations cgroup volume with read-write permissions as it can break your session. Only use this inside of a virtual machine.
4. Use Ansible inside the container:
   a. `docker exec --tty test-container env TERM=xterm ansible --version`
   b. `docker exec --tty test-container env TERM=xterm ansible-playbook /path/to/ansible/playbook.yml --syntax-check`

## Notes

I use Docker to test my Ansible roles and playbooks on multiple OSes using CI tools like Jenkins and Travis. This container allows me to test roles and playbooks using Ansible running locally inside the container.

> **Important Note**: I use this image for testing in an isolated environment—not for production—and the settings and configuration used may not be suitable for a secure and performant production environment. Use on production servers/in the wild at your own risk!
