## Install all the things
.PHONY: all
all: docker

## Install docker
.PHONY: docker
docker:
	sh ./install/docker.sh

## Install crio
.PHONY: crio
crio:
	sh ./install/crio.sh

## Install containerd
.PHONY: containerd
containerd:
	sh ./install/containerd.sh

## Install kube tools
.PHONY: kube
kube:
	sh ./install/kube.sh
