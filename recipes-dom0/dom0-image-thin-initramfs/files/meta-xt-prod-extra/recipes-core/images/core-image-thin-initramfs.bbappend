DEPENDS += "u-boot-mkimage-native"

#Add Xen and additional packages to build
IMAGE_INSTALL_append = " \
    xen-xencommons \
    xen-xenstat \
    xen-misc \
    dom0 \
    dom0-run-vcpu_pin \
    dom0-run-set_root_dev \
    doma \
    doma-run \
    domd \
    domd-run \
    domf \
    domf-run \
    domd-install-artifacts \
    doma-install-artifacts \
    domf-install-artifacts \
"

generate_uboot_image() {
    ${STAGING_BINDIR_NATIVE}/uboot-mkimage -A arm64 -O linux -T ramdisk -C gzip -n "uInitramfs" \
        -d ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio.gz.uInitramfs
    ln -sfr  ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio.gz.uInitramfs ${DEPLOY_DIR_IMAGE}/uInitramfs
}

populate_vmlinux () {
    find ${STAGING_KERNEL_BUILDDIR} -iname "vmlinux*" -exec mv {} ${DEPLOY_DIR_IMAGE} \; || true
}

IMAGE_POSTPROCESS_COMMAND += " generate_uboot_image; populate_vmlinux; "

IMAGE_ROOTFS_SIZE = "65535"

