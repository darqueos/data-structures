internal class Stack<T>(size: Int) {

    private var items: Array<Any?>
    private var index: Int

    internal init {
        this.items = arrayOfNulls<Any?>(size)
        this.index = 0
    }

    internal fun isEmpty(): Boolean {
        return if (this.index == 0) true else false
    }

    internal fun isFull(): Boolean {
        return if (this.index == this.items.size) true else false
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

    internal fun push(item: T?): Unit {

        if (isFull()) {
            throw Exception("Cannot push into a full stack!")
        }

        this.items[this.index] = item
        this.index += 1
    }

    internal fun size(): Int {
        return this.index
    }

}
