- name: Conditional loop example
  hosts: localhost
  become: true
  vars:
    packages:
      - name: nginx
        install: false
      - name: apache2
        install: false
      - name: mysql-server
        install: false
  tasks:
    - name: Manage packages
      dnf:
        name: "{{ item.name }}"
        state: "{{ 'present' if item.install else 'absent' }}"
      loop: "{{ packages }}"
