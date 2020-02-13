# Docker Trap

This image implements a docker trap which waits for a SIGTERM (docker stop / docker kill) and executes some code after receiving.

My use case is to run some code on RancherOS system termination. RancherOS sends a SIGTERM to all system docker services. The trap within this image waits for it and executes a script which have to be mounted into the running container.

Make sure to mount the script you want to execute to `/run_trap_code.sh`. For example:

`docker run -v /your/script/on/host:/run_trap_code.sh ...`

### In RancherOS you'll need this to install the trap:

#### 1. Create a docker-compose.yml

```
cat >/var/lib/rancher/conf/trap.yml<<'EOF'
trap:
  image: mminks/trap:latest
  restart: always
  volumes:
    - /usr/local/bin/your_local_script.sh:/run_trap_code.sh
EOF
```

`/usr/local/bin/your_local_script.sh` is the script that is going to be executes.

#### 2. Enable the trap

`sudo ros service enable /var/lib/rancher/conf/trap.yml`

#### 3. Start the trap

`sudo ros service up trap`

