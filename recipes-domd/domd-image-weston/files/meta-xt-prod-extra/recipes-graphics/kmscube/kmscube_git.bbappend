FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_rcar = " \
    file://0001-kmscube-add-cli-argument-connector-id.patch \
"
