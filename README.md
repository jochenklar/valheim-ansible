valheim-ansible
===============

A playbook to install a [Valheim](https://www.valheimgame.com) server using the docker setup from
https://github.com/lloesche/valheim-server-docker.


Setup
-----

Create a `hosts.yml` file like this:

```yaml
all:
  hosts:
    valheim:
      ansible_host: valheim.example.com
  vars:
    # Valheim variables
    server_name: My Valheim server
    server_port: 2456
    world_name: My Valheim world
    server_pass: super_secret_password  # min 5 characters!
    server_public: false
    # Ansible variable
    ansible_python_interpreter: auto_silent
```

Move the old valheim config to `files/`:

```
files
└── valheim-config
    ├── adminlist.txt
    ├── bannedlist.txt
    ├── permittedlist.txt
    ├── prefs
    └── worlds_local
```

Run the playbook:


```
./play.sh
```

Login to the server and start Docker and Valheim:

```bash
systemctl enable --now docker
systemctl enable --now valheim
```

Useful logs:

```bash
journalctl -xf
tail -f /var/log/valheim.log
```
