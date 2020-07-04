# QuiteRSS

[QuiteRSS](https://quiterss.org/) on Docker.

## Requirements

* Docker Runtime
* Ubuntu Operating System

## Get Started

Download run script to have `quiterss` command available:

``` bash
# Download the run script to provide required Docker run options.
curl \
  --fail \
  --location \
  --show-error \
  https://raw.githubusercontent.com/dzmuh/dockerfiles/master/quiterss/quiterss \
  > /var/tmp/quiterss

# Move the download script and add it to your PATH. This makes it available from command line.
sudo mv /var/tmp/quiterss /usr/local/bin/
sudo chmod +x /usr/local/bin/quiterss

# Execute the start script to run QuiteRSS.
quiterss
```

## Build and push

Build:

``` bash
docker build --pull --rm -f "./Dockerfile" -t dzmuh/quiterss:latest "$(pwd)"
```

To push a new tag to repository:

``` bash
docker push dzmuh/quiterss:latest
```

## Links

* [dzmuh/quiterss - Docker Hub](https://hub.docker.com/r/dzmuh/quiterss)
* [Github](https://github.com/Dzmuh/dockerfiles/tree/master/quiterss)
