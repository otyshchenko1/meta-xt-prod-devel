
################################################################################
# Following inc file defines XEN version and needed glue info to get it
# built with the current yocto version
################################################################################
require ../meta-xt-images-domx/recipes-extended/xen/xen-4.14-thud.inc

SRC_URI = "git://github.com/otyshchenko1/xen.git;protocol=https;branch=ioreq_4.14_v4_devel"
