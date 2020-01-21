# Biome Plugin Git

This plugin helps you to build project when in git repository.

It overrides `do_download`, `do_verify` and `do_unpack` so your current working directory will go into _CACHE_PATH_.

**Only staged files are copied!**


## Usage

```
pkg_build_deps+=(biome/bio-plugin-git)

# You can optimize behavior by copying only sub directory
# This will safe some time in huge repo
plugin_git_subdir=components/component1

do_setup_environment() {
  source $(pkg_path_for biome/bio-plugin-git)/lib/plugin.sh
}
```

For additional configuration option see [lib/plugin.sh]
