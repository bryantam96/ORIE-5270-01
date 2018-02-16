__author__ = 'Bryan'

from mrjob.job import MRJob
from mrjob.step import MRStep
import time, string

import operator

class MRWordCounter(MRJob):

    def steps(self):
        return [
            MRStep(mapper=self.mapper1,reducer=self.reducer1),
        ]

    def mapper1(self, key, line):
        # word in each line

        for word in line.split():
            yield word[0].lower(), 1

    def reducer1(self, word, counts):
        # count words

        alphabet = list(string.ascii_lowercase)
        for char in word:
            if(char in alphabet):
                yield char,sum(counts)

if __name__ == '__main__':

    # python count_char.py -o 'results' --no-output 'quixote.txt'

    st = time.time()
    MRWordCounter.run()
    end = time.time()
    print(end-st)
