# shellcheck shell=bash

# Bio Plugin Git
# Allows to use git working directory as source
#
# Variables:
# `plugin_git_subdir` - unpack a sub directory relative to git root as source
#
# Functions:
# `plugin_git_download` - skipped, because nothing to download
# `plugin_git_verify` - skipped, because nothing to verify
# `plugin_git_unpack` - copies all git known files into CACHE_PATH


# Optionally we can unpack a sub directory relative to git root as source
: "${plugin_git_subdir:=}"

do_default_download() {
    plugin_git_download
}

plugin_git_download() {
    build_line "Skipping downloading archive: using local git repository."
    return 0
}

do_default_verify() {
    plugin_git_verify
}

plugin_git_verify() {
    build_line "Skipping checksum verification: using local git repo."
    return 0
}

do_default_unpack() {
    plugin_git_unpack
}

plugin_git_unpack() {
    local git_root
    local subdir

    git_root=$(git rev-parse --show-toplevel)
    subdir="$git_root/$plugin_git_subdir"

    build_line "Locally creating directory from $subdir at $CACHE_PATH"
    mkdir -p "$CACHE_PATH"

    (
        cd "$subdir" || return 1
        git ls-files --recurse-submodules -z | xargs -0 cp --parents --update --target-directory "$CACHE_PATH"
    )

    # Set new SRC_PATH
    SRC_PATH="$CACHE_PATH"
}

