docker build -t reuse .
docker tag reuse yijun/reuse
docker push yijun/reuse
docker run -it reuse bash
