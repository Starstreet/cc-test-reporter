.PHONY: build ecr-login push push-ecs

NAME = cc-test-reporter

ECS_IMAGE = 077700697743.dkr.ecr.us-east-1.amazonaws.com/$(NAME)

default: build

build:
	docker build -t $(NAME) .

ecr-login:
	@$$( aws ecr get-login --no-include-email )

push: push-ecs

push-ecs: ecr-login
	docker tag $(NAME):latest ${ECS_IMAGE}:latest
	docker push ${ECS_IMAGE}:latest
