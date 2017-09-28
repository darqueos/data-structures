# 3.6.2

class Queue(object):

    def __init__(self, length):
        self._items = [None] * length
        self._index = 0

    def __len__(self):
        return self._index

    def is_empty(self):
        pass

    def is_full(self):
        pass

    def dequeue(self):

        if self.is_empty():
            raise IndexError("Cannot dequeue from an empty queue.")

    def enqueue(self, item):

        if self.is_full():
            raise IndexError("Cannot enqueue into a full queue.")

        pass
