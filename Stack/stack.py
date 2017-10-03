class Stack(object):

    def __init__(self, length):
        self.__items = [None] * length
        self.__index = 0

    def __len__(self):
        return self.__index

    @property
    def is_empty(self):
        return self.__index == 0

    @property
    def is_full(self):
        return self.__index == len(self.__items)

    def peek(self):

        if self.is_empty:
            raise IndexError("Cannot peek at an empty stack!")

        return self.__items[self.__index - 1]

    def pop(self):

        if self.is_empty:
            raise IndexError("Cannot pop from an empty stack!")

        self.__index -= 1
        item = self.__items[self.__index]
        self.__items[self.__index] = None
        return item

    def push(self, item):

        if self.is_full:
            raise IndexError("Cannot push into a full stack!")

        self.__items[self.__index] = item
        self.__index += 1
