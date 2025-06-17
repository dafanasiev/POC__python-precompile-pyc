all: oci-image

oci-image:
	docker buildx build --build-arg PYTHON_VERSION=$(shell grep python .tool-versions | awk '{print $$2}') -t dev:0 --progress=plain .
