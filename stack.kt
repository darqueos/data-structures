internal class Stack<T>(size: Int) {

    private var items: Array<Any?>
    private var index: Int

    internal init {
        this.items = arrayOfNulls<Any?>(size)
        this.index = 0
    }

    internal fun isEmpty(): Boolean {
        return this.index == 0
    }

    internal fun isFull(): Boolean {
        return this.index == this.items.size
    }

    internal fun peek(): T? {

        if (this.isEmpty()) {
            throw Exception("Cannot pop from an empty stack!")
        }

        return this.items[this.index - 1] as T?
    }

    internal fun pop(): T? {

        if (this.isEmpty()) {
            throw Exception("Cannot pop from an empty stack!")
        }

        this.index -= 1
        var item = this.items[this.index]
        this.items[this.index] = null
        return item as T?
    }

    internal fun push(item: T?): Unit {

        if (this.isFull()) {
            throw Exception("Cannot push into a full stack!")
        }

        this.items[this.index] = item
        this.index += 1
    }

    internal fun size(): Int {
        return this.index
    }

}
