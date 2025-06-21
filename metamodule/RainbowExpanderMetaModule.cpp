#include "../src/Common.hpp"
#include "../src/plugin.hpp"

using namespace prism;

struct RainbowScaleExpander : rack::Module {};

struct RainbowScaleExpanderWidget : ModuleWidget {
  RainbowScaleExpanderWidget(RainbowScaleExpander *module) {}
};

Model *modelRainbowScaleExpander =
    createModel<RainbowScaleExpander, RainbowScaleExpanderWidget>(
        "RainbowScaleExpander");
