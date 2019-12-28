# IHateJumbles
An anagram descrambler using hashtables and JSON

The object has the following methods

find(scrambled_word)
Takes a mixed-up string as input and returns a list of words that can be made from the characters
This puts an error message if the word contains non-alphabetic characters like punctuation or whitespace.

make_dict(filename)
Reads a line delimeted text file of words and turns it into a hash table for the find method to use

save_dict(filename)
Writes the hash table to a JSON file

load_dict(filename)
reads aJSON file to use as a hash table for lookup.
