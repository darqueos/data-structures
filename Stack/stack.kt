// 1.1.3

internal class Stack<T>(size: Int) {

  internal val isEmpty: Boolean
    get() = this.index == 0

  internal val isFull: Boolean
    get() = this.index == this.items.size

  internal val size: Int
    get() = this.index

  private var items: Array<Any?>
  private var index: Int

  internal init {
    this.items = arrayOfNulls<Any?>(size)
    this.index = 0
  }

  internal fun peek(): T? {

    if (this.isEmpty) {
      throw Exception("Cannot peek at an empty stack!")
    }

    return this.items[this.index - 1] as T?
  }

  internal fun pop(): T? {

    if (this.isEmpty) {
      throw Exception("Cannot pop from an empty stack!")
    }

    this.index -= 1
    val item = this.items[this.index]
    this.items[this.index] = null
    return item as T?
  }

  internal fun push(item: T?): Unit {

    if (this.isFull) {
      throw Exception("Cannot push into a full stack!")
    }

    this.items[this.index] = item
    this.index += 1
  }

}
