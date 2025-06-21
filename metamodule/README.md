## Prism MetaModule plugin

This directory contains the files needed to build the Prism plugin for the
MetaModule platform.

### Getting the MetaModule plugin SDK

This requires the MetaModule plugin SDK installed on your computer. You can
install it anywhere on your computer, and set the environment variable
`METAMODULE_SDK_DIR` to point to the installation location.

Example how to install the SDK:

```bash
cd $HOME/path/to/metamodule-projects
git clone https://github.com/4ms/metamodule-plugin-sdk --recursive 
export METAMODULE_SDK_DIR=$HOME/path/to/metamodule-projects
```

Add the `export METAMODULE_SDK_DIR=...` line to your `.bashrc` or `.zshrc` file if you
want to have the SDK available always. Otherwise you will need to execute this
line each session.

### Building

To configure the build:

```bash
cmake --fresh -B build -G Ninja
```

This will use the `METAMODULE_SDK_DIR` environment variable to find the SDK.

To build:

```bash
cmake --build build
```


### Other options

Alternatively, if you want to specify a path to a specifc SDK (for instance, if you have
multiple versions of the SDK installed), then the configure commands would be this:

```bash
cmake --fresh -B build -G Ninja -DMETAMODULE_SDK_DIR=/path/to/metamodule-plugin-sdk
```

This will override any `METAMODULE_SDK_DIR` environment variable you have set.

By default, the plugin is put into `metamodule-plugins/`. You can override this using the 
cmake option `-DINSTALL_DIR=path/to/install/plugin/` when you configure the build.

