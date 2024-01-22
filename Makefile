.EXPORT_ALL_VARIABLES:

RUNNER=ansible/runner/ansible-runner.sh

.PHONY: prepare-ansible
prepare-ansible: start-ansible-runner ansible-credentials

.PHONY: start-ansible-runner
start-ansible-runner: 
	make -C ansible/runner start-ansible-runner

.PHONY: ansible-credentials
ansible-credentials:
	${RUNNER} ansible-playbook create_vault_credentials.yaml