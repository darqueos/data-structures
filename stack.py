class Stack:

    def __init__(self, length):
        self.items = [None] * length
        self.index = 0

    def empty(self):
        return True if self.index == 0 else False

    def full(self):
        return True if self.index == len(self.items) else False

    def peek(self):

        if self.empty():
            raise IndexError("Cannot peek at an empty stack!")

        return self.items[self.index - 1]

    def pop(self):

        if self.empty():
            raise IndexError("Cannot pop from an empty stack!")

        self.index -= 1
        item = self.items[self.index]
        self.items[self.index] = None
        return item

    def push(self, item):

        if self.full():
            raise IndexError("Cannot push into a full stack!")

        self.items[self.index] = item
        self.index += 1

    def size(self):
        return self.index
