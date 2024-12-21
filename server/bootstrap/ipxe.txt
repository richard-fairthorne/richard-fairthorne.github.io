#!ipxe

set STREAM stable
set VERSION 41.20241122.3.0
set INSTALLDEV /dev/sda
set CONFIGURL https://richard-fairthorne.github.io/server/bootstrap/config.ign

set BASEURL https://builds.coreos.fedoraproject.org/prod/streams/${STREAM}/builds/${VERSION}/x86_64

kernel ${BASEURL}/fedora-coreos-${VERSION}-live-kernel-x86_64 initrd=main coreos.live.rootfs_url=${BASEURL}/fedora-coreos-${VERSION}-live-rootfs.x86_64.img coreos.inst.install_dev=${INSTALLDEV} coreos.inst.ignition_url=${CONFIGURL}
initrd --name main ${BASEURL}/fedora-coreos-${VERSION}-live-initramfs.x86_64.img

boot
