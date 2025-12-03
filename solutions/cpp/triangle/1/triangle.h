#if !defined(TRIANGLE_H)
#define TRIANGLE_H

#include <stdexcept>
#include <cstdint>

namespace triangle {
    struct flavor {
        static constexpr const uint8_t
            equilateral { 3 },
            isosceles   { 1 },
            scalene     { 0 };
    };

    uint8_t kind(const double& x, const double& y, const double& z);
}

#endif // TRIANGLE_H