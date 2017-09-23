class Stack:

    def __init__(self):
        self.items = []

    def size(self):
        return len(self.items)

    def empty(self):
        return self.size() == 0

    def push(self, item):
        self.items.append(item)

    def pop(self):
        if not self.empty():
            return self.items.pop()
        else:
            raise RuntimeError("Cannot pop from an empty stack!")
