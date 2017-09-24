internal final class Stack<T> {

    private var items: Array<Any?>
    private var index: Int

    internal init(count: Int) {
        self.items = Array<Any?>(repeating: nil, count: count)
        self.index = 0
    }

    internal func isEmpty() -> Bool {
        return self.index == 0
    }

    internal func isFull() -> Bool {
        return self.index == self.items.count
    }

    internal fun peek(): T? {

        if (isEmpty()) {
            throw Exception("Cannot pop from an empty stack!")
        }

        return this.items[this.index - 1] as T?
    }

    internal fun pop(): T? {

        if (isEmpty()) {
            throw Exception("Cannot pop from an empty stack!")
        }

        this.index -= 1
        var item = this.items[this.index]
        this.items[this.index] = null
        return item as T?
    }

    internal func push(item: T?) throws -> Void {

        if (self.isFull()) {
            throw Error("Cannot push into a full stack!")
        }

        self.items[self.index] = item
        self.index += 1
    }

    internal func count() -> Int {
        return self.index
    }

}

}
