build:
	docker build -t zaqar .

run:
	mkdir -p data
	docker run --name zaqar -d -p 8888:8888 -v ${PWD}/data:/data zaqar
