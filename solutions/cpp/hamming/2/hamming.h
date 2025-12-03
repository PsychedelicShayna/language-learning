#if !defined(HAMMING_H)
#define HAMMING_H

#include <stdexcept>
#include <numeric>
#include <string>

namespace hamming {
    uint32_t compute(const std::string& a, const std::string& b);
}  // namespace hamming

#endif // HAMMING_H