// 4.0

internal final class Queue<T> {

  private var items: Array<T?>
  private var index: Int

  internal init(length: Int) {
    self.items = [T?](repeating: nil, count: length)
    self.index = 0
  }

  internal func isEmpty() -> Bool {
    return self.index == 0
  }

  internal func isFull() -> Bool {
    return self.index >= self.items.count
  }

  internal func peek() throws -> T? {

    guard !self.isEmpty() else {
      throw QueueError.emptyQueue(reason: "Cannot peek at an empty queue!")
    }

    return self.items[self.index - 1]
  }

  internal func pop() throws -> T? {

    guard !self.isEmpty() else {
      throw QueueError.emptyQueue(reason: "Cannot pop at an empty queue!")
    }

    self.index -= 1
    let item: T? = self.items[self.index]
    self.items[self.index] = nil
    return item
  }

  internal func push(item: T?) throws -> Void {

    guard !self.isFull() else {
      throw QueueError.fullQueue(reason: "Cannot push into a full stack!")
    }

    self.items[self.index] = item
    self.index += 1
  }

  internal func size() -> Int {
    return self.index
  }

}

internal enum QueueError: Error {
  case emptyQueue(reason: String)
  case fullQueue(reason: String)
}
