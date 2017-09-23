class Stack<T>(size: Int) {

    private var items: Array<Any?>
    private var index: Int

    init {
        this.items = arrayOfNulls<Any?>(size)
        this.index = 0
    }

    fun isEmpty(): Boolean {
        return if (this.index == 0) true else false
    }

    fun isFull(): Boolean {
        return if (this.index == this.items.size) true else false
    }

//  fun peek(): T? {}

//  fun pop(): T? {}

//  fun push(item: T?) {}

    fun size(): Int {
        return this.index
    }

}
