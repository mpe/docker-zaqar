FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -q update
RUN apt-get -y install \
	python-pip \
	build-essential \
	git \
	python-dev \
	libxslt1-dev \
	zlib1g-dev

RUN git clone https://github.com/openstack/zaqar.git
RUN cd zaqar && pip install --log-file /dev/null .
RUN rm -rf zaqar
ADD zaqar.conf /etc/zaqar.conf
RUN useradd zaqar
RUN mkdir /data
RUN chown zaqar /data
USER zaqar
VOLUME /data
EXPOSE 8888
CMD ["zaqar-server", "-v"]
