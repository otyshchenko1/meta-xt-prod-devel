FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

BRANCH = "v5.4.72/rcar-4.1.0.rc2-xt0.1"
SRCREV = "${AUTOREV}"
LINUX_VERSION = "5.4.72"

SRC_URI = " \
    git://github.com/otyshchenko1/linux.git;branch=${BRANCH} \
    file://defconfig \
  "
do_deploy_append () {
    find ${D}/boot -iname "vmlinux*" -exec tar -cJvf ${STAGING_KERNEL_BUILDDIR}/vmlinux.tar.xz {} \;
}
