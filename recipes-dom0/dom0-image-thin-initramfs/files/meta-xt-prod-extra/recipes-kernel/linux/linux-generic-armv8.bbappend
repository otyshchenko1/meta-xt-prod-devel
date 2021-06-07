FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

BRANCH = "v5.10/rcar-5.0.0.rc4-xt0.1"
SRCREV = "${AUTOREV}"
LINUX_VERSION = "5.10.0"

KERNEL_FEATURES_remove = "cfg/virtio.scc"

SRC_URI = " \
    git://github.com/otyshchenko1/linux.git;branch=${BRANCH} \
    file://defconfig \
  "
do_deploy_append () {
    find ${D}/boot -iname "vmlinux*" -exec tar -cJvf ${STAGING_KERNEL_BUILDDIR}/vmlinux.tar.xz {} \;
}
