# in the previous section, we imported the squashfs image into Docker as 'ubuntulive:base'
FROM ubuntulive:base

# set environment variables so apt installs packages non-interactively
# these variables will only be set in Docker, not in the resultant image
ENV DEBIAN_FRONTEND=noninteractive DEBIAN_PRIORITY=critical

# make some modifications, e.g. install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update
RUN apt-get install -y google-chrome-stable

# install packages needed to repack the ISO (we'll be using this image to repack itself)
# grub-pc-bin needed for BIOS support
# grub-egi-amd64-bin and grub-efi-amd64-signed for EFI support
# grub2-common, mtools and xorriso are needed to build the ISO, xorriso is in universe repository
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
RUN apt-get install -y grub2-common grub-pc-bin grub-efi-amd64-bin grub-efi-amd64-signed mtools xorriso

# delete obsolete packages and any temporary state
RUN apt-get autoremove -y && apt-get clean
COPY restore-resolvconf-symlink.service /etc/systemd/system/
RUN ln -s /etc/systemd/system/restore-resolvconf-symlink.service /etc/systemd/system/multi-user.target.wants
RUN rm -rf \
    /tmp/* \
    /boot/* \
    /var/backups/* \
    /var/log/* \
    /var/crash/* \
    /var/lib/apt/lists/* \
    ~/.bash_history
#    /var/run/* \

