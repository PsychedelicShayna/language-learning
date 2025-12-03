#include "hamming.h"

namespace hamming {
    uint32_t compute(const std::string& a, const std::string& b) {
        if(a.size() != b.size()) 
            throw std::domain_error {"Cannot compute, lengths differ!"};
        
        uint32_t distance = 0;
        
        for(size_t i = 0; i < a.size(); ++i)
            distance += a[i] != b[i];    
    
        return distance;
    }
}
