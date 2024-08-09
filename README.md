# docker-ubuntu
Ubuntu container kit in Docker

## Instructions

1. Navigate to the directory of the project.
2. Run the `make` command to build the project.
3. *** If you are using Docker for the first time, you will need to open it manually and accept the user agreement. ***
4. Connect to the container using the following command inthe terminal or Remote - SSH extension in VSCode
   ```bash
   ssh -p 4242 root@localhost
5. Use the `make help` command for other commands.

---
## *The Container Contains*
1. [x] Package Managers and System Tools
   - `curl`
   - `wget`
   - `vim`
   - `git`

2. [x] Compilers and Construction Tools
   - `g++`
   - `clang`
   - `gcc`
   - `make`

3. [x] Python ve Pipx
   - `python3`
   - `python3-pip`
   - `pipx`

4. [x] Libraries and Development Tools
   - `libreadline-dev`
   - `valgrind`

5. [x] SSH Server
   - `openssh-server`

6. [ ] Minilibx
   - > **in progress...** :hourglass_flowing_sand:

