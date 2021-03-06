FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

###############################################################################
# extra layers and files to be put after Yocto's do_unpack into inner builder
###############################################################################
# these will be populated into the inner build system on do_unpack_xt_extras
XT_QUIRK_UNPACK_SRC_URI += "file://meta-xt-prod-extra;subdir=repo"
# these layers will be added to bblayers.conf on do_configure
XT_QUIRK_BB_ADD_LAYER += "meta-xt-prod-extra"

################################################################################
# Renesas R-Car
################################################################################
SRC_URI_rcar = "repo://github.com/xen-troops/manifests;protocol=https;branch=vgpu-dev;scmdata=keep"
XT_QUIRK_PATCH_SRC_URI_rcar = "file://${S}/meta-renesas/meta-rcar-gen3/docs/sample/patch/patch-for-linaro-gcc/0001-rcar-gen3-add-readme-for-building-with-Linaro-Gcc.patch;patchdir=meta-renesas"
XT_BB_LAYERS_FILE_rcar = "meta-rcar-gen3/doc/bblayers.conf"
XT_BB_LOCAL_CONF_FILE_rcar = "meta-rcar-gen3/doc/local-wayland.conf"

python do_unpack_append_rcar() {
    bb.build.exec_func('rcar_unpack_evaproprietary', d)
}

configure_versions_rcar() {
    local local_conf="${S}/build/conf/local.conf"

    cd ${S}
    base_update_conf_value ${local_conf} PREFERRED_VERSION_libdrm "2.4.68"
}

python do_configure_append_rcar() {
    bb.build.exec_func("configure_versions_rcar", d)
}

################################################################################
# Generic
################################################################################
XT_BB_IMAGE_TARGET = "core-image-weston core-image-minimal-initramfs"
