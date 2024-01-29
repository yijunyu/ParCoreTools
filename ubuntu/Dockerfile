FROM amd64/ubuntu
RUN apt update
RUN apt install p7zip-full grub2-common mtools xorriso squashfs-tools-ng jq -y
RUN apt install wget -y
RUN wget https://releases.ubuntu.com/22.04.3/ubuntu-22.04.3-desktop-amd64.iso
RUN 7z e -o. ubuntu-22.04.3-desktop-amd64.iso casper/filesystem.squashfs
RUN sqfs2tar filesystem.squashfs > docker.img
#RUN docker import docker.img "ubuntulive:base"
