# FLAGS will be passed to both the C and C++ compiler
FLAGS += -flto
CFLAGS +=
CXXFLAGS +=

# Careful about linking to shared libraries, since you can't assume much about the user's environment and library search path.
# Static libraries are fine.
LDFLAGS += -flto

# Add .cpp and .c files to the build
SOURCES += $(wildcard src/*.cpp src/scales/*.cpp)

# Add files to the ZIP package when running `make dist`
# The compiled plugin is automatically added.
DISTRIBUTABLES += $(wildcard LICENSE*) res

# If RACK_DIR is not defined when calling the Makefile, default to two levels above
RACK_DIR ?= ../..

# Include the VCV Rack plugin Makefile framework
include $(RACK_DIR)/plugin.mk

mm-plugin:
	cmake -B build -G Ninja -DMETAMODULE_SDK_DIR=metamodule-plugin-sdk
	cmake --build build

install-mm-sdk:
	rm -rf metamodule-plugin-sdk
	git clone https://github.com/4ms/metamodule-plugin-sdk --recursive 

install-mm-sdk-2.0:
	rm -rf metamodule-plugin-sdk
	git clone -b v2.0-dev https://github.com/4ms/metamodule-plugin-sdk --recursive 
