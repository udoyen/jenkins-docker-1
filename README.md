# Building a Jenkins container to run docker locally.

Code for the article: <insert link here when online>

## Create Image, Volume and start Jenkins in a Docker container named `jenkins`

```bash
make install
```

### Remove Image, Container and Volume

```bash
make clean
```

### Stop Jenkins

```bash
docker stop jenkins
```

Note: if you changed value `JENKINS_CONTAINER` in config, use that value instead.

```bash
docker stop <JENKINS_CONTAINER>
```

### Re-Start Jenkins

```bash
docker start jenkins
```

Note: if you changed value `JENKINS_CONTAINER` in config, use that value instead.

```bash
docker start <JENKINS_CONTAINER>
```

## Create Jenkins' Docker Image

```bash
make image
```

## Create Jenkins' Docker Volume

```bash
make volume
```

## Start Jenkins in a Docker Container named `jenkins`

```bash
make container
```
