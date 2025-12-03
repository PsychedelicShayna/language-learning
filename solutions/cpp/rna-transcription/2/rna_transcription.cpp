#include "rna_transcription.h"


namespace rna_transcription {
    // I couldn't help myself. I'm sorry.
    char to_rna(const char& dna) {
        return dna + (('G' - 'C') * (dna == 'C')) 
                   - (('G' - 'C') * (dna == 'G'))
                   - (('T' - 'A') * (dna == 'T'))
                   + (('U' - 'A') * (dna == 'A'));
    }

    std::string to_rna(std::string dna) {
        std::transform(dna.begin(), dna.end(), dna.begin(), 
            [](const char& character) -> char {
                return to_rna(character);
            });
        
        return dna;
    }
}
