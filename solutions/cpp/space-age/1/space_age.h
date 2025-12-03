#if !defined(SPACE_AGE_H)
#define SPACE_AGE_H

#include <cstdint>

namespace space_age {
    class space_age {
    public:
        struct OrbitalPeriod {
            static constexpr double 
                Mercury    { 0.2408467  },
                Venus      { 0.61519726 },
                Earth      { 1.0        },
                Mars       { 1.8808158  },
                Jupiter    { 11.862615  },
                Saturn     { 29.447498  },
                Uranus     { 84.016846  },
                Neptune    { 164.79132  };
        };

        const uint64_t ConvertingFrom;
        const double EarthReference;

        double
            on_mercury() const,
            on_venus()   const,
            on_earth()   const,
            on_mars()    const,
            on_jupiter() const,
            on_saturn()  const,
            on_uranus()  const,
            on_neptune() const;

        uint64_t seconds() const;

        explicit space_age(const uint64_t& converting_from);
    };
}

#endif // SPACE_AGE_H