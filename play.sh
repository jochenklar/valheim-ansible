#!/bin/bash
ansible-playbook -i hosts.yml -u root main.yml $@
