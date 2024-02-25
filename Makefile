.EXPORT_ALL_VARIABLES:

RUNNER=ansible/runner/ansible-runner.sh

.PHONY: start-ansible-runner
start-ansible-runner: 
	make -C ansible/runner start-ansible-runner

.PHONY: os-upgrade
os-upgrade:
	${RUNNER} ansible-playbook update.yaml
