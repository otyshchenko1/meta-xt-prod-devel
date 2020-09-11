
################################################################################
# Following inc file defines XEN version and needed glue info to get it
# built with the current yocto version
################################################################################
require ../meta-xt-images-domx/recipes-extended/xen/xen-4.14-thud.inc

SRC_URI = "git://github.com/otyshchenko1/xen.git;protocol=https;branch=ioreq_4.14_v8"

# TODO: Strings below are subject for new xen-4.15-xxx.inc
FILES_${PN}-xl-examples += " \
    ${sysconfdir}/xen/xlexample.pvhlinux \
"

PACKAGES_append = " \
    ${PN}-xen-access \
    "
FILES_${PN}-xen-access += " \
    ${sbindir}/xen-access \
"

FILES_${PN}-misc_append = " \
    ${sysconfdir}/bash_completion.d \
"
