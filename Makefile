.EXPORT_ALL_VARIABLES:

RUNNER=ansible/runner/ansible-runner.sh

.PHONY: prepare-ansible
prepare-ansible: start-ansible-runner create-ansible-credentials

.PHONY: start-ansible-runner
start-ansible-runner: 
	make -C ansible/runner start-ansible-runner

.PHONY: create-ansible-credentials
create-ansible-credentials:
	${RUNNER} ansible-playbook create_vault_credentials.yaml

.PHONY: view-vault-credentials
view-vault-credentials:
	${RUNNER} ansible-vault view vars/vault.yaml

.PHONY: init
init: os-upgrade k3s-install

.PHONY: os-upgrade
os-upgrade:
	${RUNNER} ansible-playbook update.yaml

.PHONY: k3s-uninstall
k3s-uninstall:
	${RUNNER} ansible-playbook k3s_uninstall.yaml

.PHONY: k3s-install
k3s-install:
	${RUNNER} ansible-playbook -v k3s_install.yaml
