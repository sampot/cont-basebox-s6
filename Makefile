GROUP=sampot
NAME=basebox-s6
VERSION=18.04-spk1


all: build

build: Dockerfile
	docker build  -t $(GROUP)/$(NAME):$(VERSION) .

publish: build
	docker push $(GROUP)/$(NAME):$(VERSION)
