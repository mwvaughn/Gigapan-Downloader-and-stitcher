FROM ubuntu:14.04.3
MAINTAINER Matthew Vaughn <vaughn@tacc.utexas.edu>

RUN apt-get update -y && \
	apt-get install -y curl wget python ImageMagick && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY gigafetch.py /usr/local/bin/
RUN chmod a+x /usr/local/bin/gigafetch.py

WORKDIR /home

ENTRYPOINT ["/bin/bash", "-c", "/usr/local/bin/gigafetch.py ${*}", "--"]

