FROM amd64/ubuntu
RUN apt update
RUN apt install -y git
RUN git clone https://github.com/yijunyu/ReuseTracker
RUN git clone https://github.com/yijunyu/ParCoreTools
RUN cd /ParCoreTools/comdetective_reusetracker_plus/AMD_IBS_Toolkit
RUN apt install -y wget 
RUN wget https://kernel.ubuntu.com/mainline/v6.1.66/amd64/linux-headers-6.1.66-060166_6.1.66-060166.202312080834_all.deb
RUN wget https://kernel.ubuntu.com/mainline/v6.1.66/amd64/linux-headers-6.1.66-060166-generic_6.1.66-060166.202312080834_amd64.deb
RUN wget https://kernel.ubuntu.com/mainline/v6.1.66/amd64/linux-image-unsigned-6.1.66-060166-generic_6.1.66-060166.202312080834_amd64.deb
RUN wget https://kernel.ubuntu.com/mainline/v6.1.66/amd64/linux-modules-6.1.66-060166-generic_6.1.66-060166.202312080834_amd64.deb
RUN dpkg -i linux-headers-6.1.66-060166_6.1.66-060166.202312080834_all.deb
RUN apt install -y libelf1
RUN dpkg -i linux-headers-6.1.66-060166-generic_6.1.66-060166.202312080834_amd64.deb
RUN dpkg -i linux-modules-6.1.66-060166-generic_6.1.66-060166.202312080834_amd64.deb
RUN apt install -y linux-base
RUN apt install -y kmod
RUN dpkg -i linux-image-unsigned-6.1.66-060166-generic_6.1.66-060166.202312080834_amd64.deb
RUN apt install -y make
RUN apt install -y gcc-12
RUN apt install -y gcc
RUN cd /ParCoreTools/comdetective_reusetracker_plus/AMD_IBS_Toolkit \
 && make
RUN cd /ParCoreTools/comdetective_reusetracker_plus/AMD_IBS_Toolkit/driver \
 && ./install_ibs_driver.sh
RUN apt install -y cmake
RUN cd /ReuseTracker \
 && make
