// This isn't covered in the test suite but that's no excuse not to check it.
fn is_valid(nucleotides: &str) -> bool {
    nucleotides
        .chars()
        .all(|c| matches!(c, 'C' | 'A' | 'G' | 'T'))
}

pub fn hamming_distance(s1: &str, s2: &str) -> Option<usize> {
    (is_valid(s1) && is_valid(s2) && s1.len() == s2.len()).then(|| {
        s1.chars()
            .zip(s2.chars())
            .filter(|(c1, c2)| c1 != c2)
            .count()
    })
}
