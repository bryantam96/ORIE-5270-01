__author__ = 'Bryan'

from mrjob.job import MRJob
from mrjob.step import MRStep
import time

class MRWordCounter(MRJob):

    def steps(self):
        return [
            MRStep(mapper=self.mapper1,reducer=self.reducer1),
            MRStep(reducer=self.reducer2)
        ]

    def mapper1(self, key, line):
        # word in each line

        for word in line.split():
            yield word, 1

    def reducer1(self, word, counts):
        # count words

        total = sum(counts)

        yield None,(total,word)

    def reducer2(self, _, pairs):
        # max 100 words

        self.list = []
        for p in pairs:
            self.list.append(p)
        for i in range(100):
            yield sorted(self.list)[::-1][i]

if __name__ == '__main__':

    # python count_word.py -o 'results' --no-output 'quixote.txt'

    st = time.time()
    MRWordCounter.run()
    end = time.time()
    print(end-st)
