#include "triangle.h"

namespace triangle {
    uint8_t kind(const double& x, const double& y, const double& z) {
        const bool& positive { (x > 0 && y > 0 && z > 0)                },
                  & equal    { (x + y >= z && x + z >= y && z + y >= x) };
        
        if(!positive || !equal) throw std::domain_error { "Invalid triangle." };
        
        return (x == y) + (y == z) + (x == z); 
    }
}