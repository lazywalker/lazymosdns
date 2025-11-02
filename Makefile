PLATFORM="linux/amd64,linux/arm/v7"
VER=latest

all: buildx

push:
	docker buildx push lazywalker/mosdns:${VER}

buildx:
	docker buildx build --platform ${PLATFORM} -t lazywalker/mosdns:${VER} --push .

local:
	docker buildx build --platform linux/arm/v7 --output=type=docker -t mosdns .
	docker save mosdns > mosdns.tar