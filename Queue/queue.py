# 3.6.2

class Queue(object):

    def __init__(self, length):
        self._items  = [None] * length
        self._length = 0
        self._first  = 0
        self._last   = length - 1

    def __len__(self):
        return self._length

    def is_empty(self):
        return self._length == 0

    def is_full(self):
        return self._length == len(self._items)

    def peek(self):

        if self.is_empty():
            raise IndexError("Cannot peek at an empty queue!")

        return self._items[self._first]

    def dequeue(self):

        if self.is_empty():
            raise IndexError("Cannot dequeue from an empty queue!")

        item = self._items[self._first]
        self._items[self._first] = None
        self._first = (self._first + 1) % len(self._items)
        self._length -= 1
        return item

    def enqueue(self, item):

        if self.is_full():
            raise IndexError("Cannot enqueue into a full queue!")

        self._last = (self._last + 1) % len(self._items)
        self._items[self._last] = item
        self._length += 1
