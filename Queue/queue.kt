internal class Queue<T>(size: Int) {

  internal var size: Int
    get() = this.size

  internal var isEmpty: Boolean = true
    get() = this.size == 0

  internal var isFull: Boolean = false
    get() = this.size == this.items.size

  private var items: Array<Any?>
  private var first: Int
  private var last: Int

  init {
    this.items = arrayOfNulls<Any?>(size)
    this.last  = size - 1
    this.first = 0
    this.size  = 0
  }

  internal fun peek(): T? {

    if (this.isEmpty) {
      throw Exception("Cannot peek at an empty queue!")
    }

    return this.items[this.first] as T?
  }

  internal fun dequeue(): T? {

    if (this.isEmpty) {
      throw Exception("Cannot dequeue from an empty queue!")
    }

    val item = this.items[this.first]
    this.items[this.first] = null
    this.first = (this.first + 1) % this.items.size
    this.size -= 1
    return item as T?
  }

  internal fun enqueue(item: T?): Unit {

    if (this.isFull) {
      throw Exception("Cannot enqueue into a full queue!")
    }

    this.last = (this.last + 1) % this.items.size
    this.items[this.last] = item
    this.size += 1
  }

}
