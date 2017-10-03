internal final class Queue<T> {

  internal var count: Int

  internal var isEmpty: Bool {
    get { return self.count == 0 }
  }

  internal var isFull: Bool {
    get { return self.count == self.items.count }
  }

  private var items: Array<T?>
  private var first: Int
  private var last: Int

  internal init(count: Int) {
    self.items = [T?](repeating: nil, count: count)
    self.last  = count - 1
    self.first = 0
    self.count = 0
  }

  internal func peek() throws -> T? {

    guard !self.isEmpty else {
      throw QueueError.emptyQueue(reason: "Cannot peek at an empty queue!")
    }

    return self.items[self.first]
  }

  internal func dequeue() throws -> T? {

    guard !self.isEmpty else {
      throw QueueError.emptyQueue(reason: "Cannot dequeue from an empty queue!")
    }

    let item: T? = self.items[self.first]
    self.items[self.first] = nil
    self.first = (self.first + 1) % self.items.count
    self.count -= 1
    return item
  }

  internal func enqueue(item: T?) throws -> Void {

    guard !self.isFull else {
      throw QueueError.fullQueue(reason: "Cannot enqueue into a full queue!")
    }

    self.last = (self.last + 1) % self.items.count
    self.items[self.last] = item
    self.count += 1
  }

}

internal enum QueueError: Error {
  case emptyQueue(reason: String)
  case fullQueue(reason: String)
}
