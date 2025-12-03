#include "pangram.h"

namespace pangram {
    bool is_pangram(std::string string) {
        std::transform(string.begin(), string.end(), string.begin(), 
            [](const char& character) -> char {
                return std::tolower(character);
            });
        
        std::bitset<26> occurrences;
        
        for(const auto& character : string) {
            if(character >= 'a' && character <= 'z')
                occurrences.set(character - 'a');
        }

        return occurrences.all();
    }
}
