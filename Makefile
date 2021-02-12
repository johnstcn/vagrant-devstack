all: up

.PHONY: up
up:
	vagrant up --provision

.PHONY: down
down:
	vagrant halt

.PHONY: nuke
nuke:
	vagrant destroy -f
