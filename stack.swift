internal final class Stack<T> {

    private var items: Array<Any?>
    private var index: Int

    internal init(length: Int) {
        self.items = [Any?](repeating: nil, count: length)
        self.index = 0
    }

    internal func isEmpty() -> Bool {
        return self.index == 0
    }

    internal func isFull() -> Bool {
        return self.index == self.items.count
    }

    internal fun peek(): T? {

        guard !self.isEmpty() {
            throw StackError.emptyStack("Cannot pop from an empty stack!")
        }

        return self.items[self.index - 1] as T?
    }

    internal fun pop(): T? {

        guard !self.isEmpty() else {
            throw StackError.emptyStack("Cannot pop from an empty stack!")
        }

        self.index -= 1
        let item = self.items[self.index]
        self.items[self.index] = nil
        return item as T?
    }

    internal func push(item: T?) throws -> Void {

        guard !self.isFull() else {
            throw StackError.fullStack("Cannot push into a full stack!")
        }

        self.items[self.index] = item
        self.index += 1
    }

    internal func size() -> Int {
        return self.index
    }

}

enum StackError: Error {
    case emptyStack
    case fullStack
}
