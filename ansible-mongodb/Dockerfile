#!/bin/bash
FROM williamyeh/ansible:centos7
WORKDIR /usr/src/
COPY * /usr/src/
CMD yes y |ssh-keygen -q -t rsa -N '' >/dev/null
CMD ssh-copy-id -i ~/.ssh/id_rsa user01@35.228.5.197 -oStrictHostKeyChecking=no
RUN ansible-playbook -i inventory provisioner.yml