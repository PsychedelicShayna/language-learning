#ifndef NUCLEOTIDE_COUNT_H
#define NUCLEOTIDE_COUNT_H

#include <algorithm>
#include <numeric>
#include <string>
#include <array>
#include <map>

namespace nucleotide_count {
    class counter {
    public:
        const std::string dna;

        static bool is_valid(char nucleotide);

        std::map<char, int> nucleotide_counts() const;
        int count(const char target_char) const;

        explicit counter(const std::string& dna);
    };
}

#endif // NUCLEOTIDE_COUNT_H