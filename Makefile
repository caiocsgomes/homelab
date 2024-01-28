.EXPORT_ALL_VARIABLES:

RUNNER=ansible/runner/ansible-runner.sh

.PHONY: prepare-ansible
prepare-ansible: start-ansible-runner prepare-ansible

.PHONY: start-ansible-runner
start-ansible-runner: 
	make -C ansible/runner start-ansible-runner

.PHONY: prepare-ansible
prepare-ansible: 
	${RUNNER} ansible-playbook prepare_ansible.yaml

.PHONY: init
init: os-upgrade k3s-install

.PHONY: os-upgrade
os-upgrade:
	${RUNNER} ansible-playbook update.yaml

.PHONY: k3s-install
k3s-install:
	${RUNNER} ansible-playbook -v k3s_install.yaml

## Utils

.PHONY: view-vault-credentials
view-vault-credentials:
	${RUNNER} ansible-vault view vars/vault.yaml

.PHONY: k3s-uninstall
k3s-uninstall:
	${RUNNER} ansible-playbook k3s_uninstall.yaml