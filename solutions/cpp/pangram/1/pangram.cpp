#include "pangram.h"

namespace pangram {
    bool is_pangram(std::string string) {
        
        std::transform(string.begin(), string.end(), string.begin(), 
            [](const char& character) -> char {
                return (character >= 'a' && character <= 'z') 
                        ? character & 0b11011111 : character;
            });
    
        std::array<uint8_t, 26> occurrences {};

        for(const auto& character : string) {
            if(character >= 'A' && character <= 'Z')
                ++occurrences[character - 'A'];
        }
        
        return 
            std::all_of(occurrences.begin(), occurrences.end(), 
                [](const uint8_t& occurence_count) -> bool { 
                    return occurence_count;
                });
    }
}
