# shellcheck shell=bash

pkg_origin=biome
pkg_name=bio-plugin-git
pkg_version=0.1.0
pkg_description="The Biome Plugin Git"

pkg_maintainer="Yauhen Artsiukhou <jsirex@gmail.com>"
pkg_license=("MIT")

pkg_deps=(core/git)

# This package uses self
plugin_git_subdir=habitat

do_setup_environment() {
    source "$PLAN_CONTEXT/lib/plugin.sh"
}

do_build() {
    return 0
}

do_install() {
    # shellcheck disable=SC2154
    cp -r lib "$pkg_prefix"
}

do_strip() {
    return 0
}
