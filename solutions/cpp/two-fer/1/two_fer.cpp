#include "two_fer.h"

namespace two_fer {
    // Overengineered for no reason. 
    // String concat is so vanilla.
    std::string two_fer(const std::string& name) {
        std::stringstream stream {};
        stream << "One for " << name << ", one for me.";
        return stream.str();
    }

    std::string two_fer() {
        return "One for you, one for me.";
    }
}
