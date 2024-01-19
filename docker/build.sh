docker build -t reuse .
dccker tag reuse yijun/reuse
docker push yijun/reuse
docker run -it reuse bash
