#include "hamming.h"

namespace hamming {
    uint32_t compute(const std::string& a, const std::string& b) {
        if(a.size() != b.size()) 
            throw std::domain_error {"Cannot compute, lengths differ!"};

        return std::inner_product(
            a.begin(), a.end(), 
            b.begin(), 0,
            std::plus<uint32_t>(), 
            std::not_equal_to<uint32_t>()
        );
    }
} // namespace hamming
