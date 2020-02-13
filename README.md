# Docker Trap

This image implements a docker trap which waits for a SIGTERM (docker stop / docker kill) and executes some code after receiving.

My use case is to run some code on RancherOS system termination. RancherOS sends a SIGTERM to all system docker services. The trap within the image waits for it and executes a script which have to be mounted into the container.
