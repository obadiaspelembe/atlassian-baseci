# Atlassian Base CI

Customized Bitbucket Atlassian default image with terraform and [Linode Syncronizer Tool - Linsync](https://github.com/obadiaspelembe/linsync). 


## Conditions
Before start using this project make sure you replace following content on the ci configuration file:

````
image: atlassian/default-image:3

pipelines:
  default:
    - step:
        name: build docker image
        script:
          - echo ${DOCKER_PASSWORD} | docker login --username "$DOCKER_USERNAME" --password-stdin
          - docker build -t [YOUR_DOCKER_REPOSITORY:TAG] .
          - docker push [YOUR_DOCKER_REPOSITORY:TAG]
        services:
          - docker

````

Make sure you set the following environment variables:

| Name | Description |
| ----------- | ----------- |
| `DOCKER_USERNAME` | Docker Hub Username |
| `DOCKER_PASSWORD` | Docker Hub Password|
