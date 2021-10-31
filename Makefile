
IMAGE?=ghostunnel
REGISTRY?=ghcr.io/containerinfra
VERSION	?=local

docker:
	docker build --no-cache -t ${REGISTRY}/${IMAGE}:${VERSION} .

publish-docker:
	docker push ${REGISTRY}/${IMAGE}:${VERSION}
