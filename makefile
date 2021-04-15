VERSION=3.33
NAME=ns3:$(VERSION)

build: Dockerfile
	docker build -t $(NAME) .

run:
	docker run --rm -it -e DISPLAY=host.docker.internal:0 $(NAME)
