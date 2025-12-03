#include "pangram.h"

namespace pangram {
    bool is_pangram(std::string string) {
        std::bitset<26> occurrences;
        
        for(const char& character : string) {
            if(std::isalpha(character))
                occurrences.set(std::tolower(character) - 'a');
        }

        return occurrences.all();
    }
}
