from python:3.10.9-alpine

RUN apk add --no-cache gcc g++ musl-dev make

RUN wget https://github.com/gao-lab/CPC2_standalone/archive/refs/tags/v1.0.1.tar.gz && \
    tar -xf v1.0.1.tar.gz && \
    rm v1.0.1.tar.gz

RUN pip install --no-cache-dir six numpy biopython
ENV CPC_HOME=/CPC2_standalone-1.0.1
RUN cd /CPC2_standalone-1.0.1/libs/libsvm && \
    tar -xf libsvm-3.18.tar.gz && \
    rm libsvm-3.18.tar.gz && \
    cd libsvm-3.18 && \
    make clean && make
WORKDIR /workdir
ENTRYPOINT [ "/CPC2_standalone-1.0.1/bin/CPC2.py" ]