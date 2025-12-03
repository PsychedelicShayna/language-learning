#include "nucleotide_count.h"

namespace nucleotide_count {
    bool counter::is_valid(char nucleotide) {
        static const std::array<char, 4>& valid { 'A', 'G', 'C', 'T' };
        return std::find(valid.begin(), valid.end(), nucleotide) != valid.end();
    }

    std::map<char, int> counter::nucleotide_counts() const { 
        std::map<char, int> occurrence_map { {'A', 0}, {'T', 0}, {'C', 0}, {'G', 0} };
        
        for(const auto& nucleotide : dna)
            ++occurrence_map[nucleotide];
    
        return occurrence_map;
    }
    
    int counter::count(const char target_char) const {
        if(!is_valid(target_char)) 
            throw std::invalid_argument {"Input is not a valid nucleotide!"};
        
        return std::accumulate(dna.begin(), dna.end(), 0, 
                [&target_char](int acc, char c) -> int {
                    return acc + (c == target_char);
                });
    }
    
    counter::counter(const std::string& dna) : dna {dna} { 
        if(!std::all_of(dna.begin(), dna.end(), is_valid)) {
            throw std::invalid_argument {"Input contains invalid nucleotide!"};
        }
    }
}
