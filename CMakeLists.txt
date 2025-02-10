cmake_minimum_required(VERSION 3.22)

if(NOT "${METAMODULE_SDK_DIR}" STREQUAL "")
	message("METAMODULE_SDK_DIR set by CMake variable ${METAMODULE_SDK_DIR}")
elseif (DEFINED ENV{METAMODULE_SDK_DIR})
    set(METAMODULE_SDK_DIR "$ENV{METAMODULE_SDK_DIR}")
	message("METAMODULE_SDK_DIR set by environment variable ${METAMODULE_SDK_DIR}")
else()
    set(METAMODULE_SDK_DIR "${CMAKE_CURRENT_LIST_DIR}/../metamodule-plugin-sdk")
	message("METAMODULE_SDK_DIR set to default: ${METAMODULE_SDK_DIR}")
endif()

include(${METAMODULE_SDK_DIR}/plugin.cmake)

project(PrismMetaModulePlugin
    DESCRIPTION "Prism Plugin for MetaModule" 
    LANGUAGES   C CXX ASM
)

add_library(Prism STATIC)

set(SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR})

target_sources(Prism
    PRIVATE
    ${SOURCE_DIR}/src/Audio.cpp
    ${SOURCE_DIR}/src/Constants.cpp
    ${SOURCE_DIR}/src/Droplet.cpp
    ${SOURCE_DIR}/src/DropletAudio.cpp
    ${SOURCE_DIR}/src/DropletFilter.cpp
    ${SOURCE_DIR}/src/Envelope.cpp
    ${SOURCE_DIR}/src/Filter.cpp
    ${SOURCE_DIR}/src/FilterBank.cpp
    ${SOURCE_DIR}/src/Inputs.cpp
    ${SOURCE_DIR}/src/LEDRing.cpp
    ${SOURCE_DIR}/src/LPF.cpp
    ${SOURCE_DIR}/src/Levels.cpp
    ${SOURCE_DIR}/src/Q.cpp
    ${SOURCE_DIR}/src/Rainbow.cpp
    ${SOURCE_DIR}/src/RainbowExpanderMetaModule.cpp
    ${SOURCE_DIR}/src/Rotation.cpp
    ${SOURCE_DIR}/src/Tuning.cpp
    ${SOURCE_DIR}/src/plugin.cpp
    ${SOURCE_DIR}/src/scales/BP.cpp
    ${SOURCE_DIR}/src/scales/Buchla296.cpp
    ${SOURCE_DIR}/src/scales/ET_Chromatic.cpp
    ${SOURCE_DIR}/src/scales/ET_Intervals.cpp
    ${SOURCE_DIR}/src/scales/ET_Major.cpp
    ${SOURCE_DIR}/src/scales/ET_Minor.cpp
    ${SOURCE_DIR}/src/scales/ET_Triad.cpp
    ${SOURCE_DIR}/src/scales/ET_Wholestep.cpp
    ${SOURCE_DIR}/src/scales/Gamelan.cpp
    ${SOURCE_DIR}/src/scales/Indian_Penta.cpp
    ${SOURCE_DIR}/src/scales/Indian_Shrutis.cpp
    ${SOURCE_DIR}/src/scales/JI_Intervals.cpp
    ${SOURCE_DIR}/src/scales/JI_Triad.cpp
    ${SOURCE_DIR}/src/scales/JI_Wholestep.cpp
    ${SOURCE_DIR}/src/scales/Mesopotamian.cpp
    ${SOURCE_DIR}/src/scales/Scales.cpp
    ${SOURCE_DIR}/src/scales/Seventeen.cpp
    ${SOURCE_DIR}/src/scales/UserScale.cpp
    ${SOURCE_DIR}/src/scales/Video_notused.cpp
    ${SOURCE_DIR}/src/scales/WC_Alpha1.cpp
    ${SOURCE_DIR}/src/scales/WC_Alpha2.cpp
    ${SOURCE_DIR}/src/scales/WC_Gamma.cpp
    ${SOURCE_DIR}/src/scales/WC_Gamma_notused.cpp
)

target_compile_options(Prism
	PRIVATE 
)

set_property(TARGET Prism PROPERTY CXX_STANDARD 20)

if("${INSTALL_DIR}" STREQUAL "")
    set(INSTALL_DIR ${CMAKE_CURRENT_LIST_DIR}/metamodule-plugins)
endif()

create_plugin(
    SOURCE_LIB      Prism                                          # This is the cmake target name (defined in add_target)
    PLUGIN_NAME     Prism                                          # This must match the brand "slug" used in VCV Rack
    PLUGIN_JSON     ${SOURCE_DIR}/plugin.json                      # Path to the plugin.json file used by VCV Rack
    SOURCE_ASSETS   ${CMAKE_CURRENT_LIST_DIR}/assets               # Path to the assets/ dir containing the PNGs
    DESTINATION     ${INSTALL_DIR}                                 # Dir where plugin .mmplugin file should be put
)

