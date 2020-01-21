# Biome Plugin Git

This plugin helps you to build project when in git repository.

It overrides `do_default_download`, `do_default_verify` and `do_default_unpack` so your current working directory will go into _CACHE_PATH_.

**Only staged files are copied!**

## Usage

```
pkg_build_deps+=(biome/bio-plugin-git)

# You can optimize behavior by copying only sub directory
# This will safe some time in huge repo
pkg_git_subdir=components/component1

do_setup_environment() {
  source $(pkg_path_for biome/bio-plugin-git)/lib/plugin.sh
}
```

Consider source [bio-plugin-git](habitat/lib/plugin.sh)
