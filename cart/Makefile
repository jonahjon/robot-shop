IMG_NAME = robot-shop/cart
ACCOUNT?=164382793440
AWS_DEFAULT_REGION?=us-west-2
DOCKER_PUSH_REPOSITORY?=dkr.ecr.$(AWS_DEFAULT_REGION).amazonaws.com
TAG?=latest
IMAGE=$(ACCOUNT).$(DOCKER_PUSH_REPOSITORY)/$(IMG_NAME)


ci-pr: build-image push-image
ci-release: build-image push-image

build-image:
	docker build -t $(IMG_NAME) .
push-image:
	docker tag $(IMG_NAME) $(IMAGE):$(TAG)
	docker tag $(IMG_NAME) $(IMAGE):latest
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE):latest