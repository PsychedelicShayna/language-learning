#if !defined(RNA_TRANSCRIPTION_H)
#define RNA_TRANSCRIPTION_H

#include <algorithm>
#include <string>

namespace rna_transcription {
    char to_rna(const char& dna);
    std::string to_rna(std::string dna);
}

#endif // RNA_TRANSCRIPTION_H