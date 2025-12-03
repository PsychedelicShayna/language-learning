#include "space_age.h"

namespace space_age {
    double space_age::on_mercury() const {
        return EarthReference / OrbitalPeriod::Mercury;
    }

    double space_age::on_venus() const {
        return EarthReference / OrbitalPeriod::Venus;
    }

    double space_age::on_earth() const {
        return EarthReference;
    }

    double space_age::on_mars() const {
        return EarthReference / OrbitalPeriod::Mars;
    }

    double space_age::on_jupiter() const {
        return EarthReference / OrbitalPeriod::Jupiter;
    }

    double space_age::on_saturn() const {
        return EarthReference / OrbitalPeriod::Saturn;
    }

    double space_age::on_uranus() const {
        return EarthReference / OrbitalPeriod::Uranus;
    }
    
    double space_age::on_neptune() const {
        return EarthReference / OrbitalPeriod::Neptune;
    }

    uint64_t space_age::seconds() const {
        return ConvertingFrom;
    }    

    space_age::space_age(const uint64_t& converting_from) 
        :
          ConvertingFrom { converting_from              },  
          EarthReference { converting_from / 31557600.0 }
    {

    }
}