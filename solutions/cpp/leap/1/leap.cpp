#include "leap.h"

namespace leap {
    bool is_leap_year(const uint32_t& year) {
        return !(year % 4) && ((year % 100) || !(year % 400));
    }
}  // namespace leap
