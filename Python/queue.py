class Queue(object):

    def __init__(self, length):
        self.__items  = [None] * length
        self.__last   = length - 1
        self.__first  = 0
        self.__length = 0

    def __len__(self):
        return self.__length

    @property
    def is_empty(self):
        return self.__length == 0

    @property
    def is_full(self):
        return self.__length == len(self.__items)

    def peek(self):

        if self.is_empty:
            raise IndexError("Cannot peek at an empty queue!")

        return self.__items[self.__first]

    def dequeue(self):

        if self.is_empty:
            raise IndexError("Cannot dequeue from an empty queue!")

        item = self.__items[self.__first]
        self.__items[self.__first] = None
        self.__first = (self.__first + 1) % len(self.__items)
        self.__length -= 1
        return item

    def enqueue(self, item):

        if self.is_full:
            raise IndexError("Cannot enqueue into a full queue!")

        self.__last = (self.__last + 1) % len(self.__items)
        self.__items[self.__last] = item
        self.__length += 1
