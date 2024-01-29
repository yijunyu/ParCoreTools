docker build -t ubuntulive .
## cp docker.img /mnt
## cat /tmp/docker.img | docker import - ubuntulive.base
#docker run -v /tmp:/mnt -it ubuntulive bash
#docker tag ubuntulive yijun/ubuntulive
#docker push yijun/ubuntulive
