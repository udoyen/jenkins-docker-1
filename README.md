# Building a Jenkins container to run docker locally

A more detailed explanation: https://www.lucacerone.net/2019/11/running-jenkins-in-a-docker-container-on-ubuntu-18-04-host/

### Change default settings

Modify the values in `config.sh`.


### Create Image, Volume and start Jenkins in a Docker container named jenkins

```bash
make install
```

### Remove Image, Container and Volume

```bash
make clean
```

### Stop Jenkins

```bash
make stop_container
```

### Re-Start Jenkins

```bash
make start_container
```

