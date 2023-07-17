# terraria-docker
Docker image for running a Terraria server on Linux or Raspberry Pi. TShock version 1.4.4.9

## Usage

Copy the dockerfile and build the image
```
curl https://raw.githubusercontent.com/surdle/terraria-docker/main/dockerfile > dockerfile
docker build -t terraria-docker:latest .
```

If you are running on a Raspberry Pi, you will need to copy the dockerfile from the arm64 folder and build the image
```
curl https://raw.githubusercontent.com/surdle/terraria-docker/main/arm64/dockerfile > dockerfile
docker build -t terraria-docker:latest .
```

Run the image
```
docker run -it -p 7777:7777 -v /home/$USER/terraria:/data --name terraria-docker terraria-docker
```

## Ports
* `7777` - Default Terraria server port

## Volumes
* `/data` - Contains the world and config files
