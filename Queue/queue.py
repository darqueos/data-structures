# 3.6.2

class Queue(object):

    def __init__(self, length):
        self._items = [None] * length
        self._first = 0
        self._last = 0

    def __len__(self):
        return (len(self._items) - self._first + self._last) % len(self._items)

    def is_empty(self):
        return self._front == self._last

    def is_full(self):
        return len(self) == len(self._items) - 1

    def dequeue(self):

        if self.is_empty():
            raise IndexError("Cannot dequeue from an empty queue.")

        item = self._items[self._first]
        self._items[self._first] = None
        self._first = (self._first + 1) % len(self._items)
        return item

    def enqueue(self, item):

        if self.is_full():
            raise IndexError("Cannot enqueue into a full queue.")

        self._items[self._last] = item
        self._last = (self._last + 1) % len(self._items)
