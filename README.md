# terraria-docker
Docker image for running a Terraria server on Linux or Raspberry Pi. TShock version 1.4.4.9

## Usage

Clone the repository and build the image
```
git clone https://github.com/surdle/terraria-docker.git
cd terraria-docker
docker build -t terraria-docker:latest .
```

Run the image
```
docker run -it -p 7777:7777 -v /home/$USER/terraria:/data --name terraria-docker terraria-docker
```

If you are running on a Raspberry Pi, you will need to move to the arm64 folder and build the image there
```
cd terraria-docker/arm64
docker build -t terraria-docker:latest .
```

## Ports
* `7777` - Default Terraria server port

## Volumes
* `/data` - Contains the world and config files
