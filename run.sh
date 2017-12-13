#!/bin/bash

# build our local docker for the data-science-reports project
docker build -t data-science-notebooks .

# run the built docker exposing port 8888 to localhost
docker run -it  --rm  --volume  `pwd`/src:/app/ -p 127.0.0.1:8888:8888 \
           --workdir /app/notebooks/ data-science-notebooks
