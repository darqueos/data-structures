# 3.6.2

class Stack(object):

    def __init__(self, length):
        self._items = [None] * length
        self._index = 0

    def __len__(self):
        return self._index

    def is_empty(self):
        return self._index == 0

    def is_full(self):
        return self._index == len(self._items)

    def peek(self):

        if self.is_empty():
            raise IndexError("Cannot peek at an empty stack!")

        return self._items[self._index - 1]

    def pop(self):

        if self.is_empty():
            raise IndexError("Cannot pop from an empty stack!")

        self._index -= 1
        item = self._items[self._index]
        self._items[self._index] = None
        return item

    def push(self, item):

        if self.is_full():
            raise IndexError("Cannot push into a full stack!")

        self._items[self._index] = item
        self._index += 1
