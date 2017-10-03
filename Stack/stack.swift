
internal final class Stack<T> {

  internal var count: Int {
    get { return self.index }
  }

  internal var isEmpty: Bool {
    get { return self.index == 0 }
  }

  internal var isFull: Bool {
    get { return self.index == self.items.count }
  }

  private var items: Array<T?>
  private var index: Int

  internal init(count: Int) {
    self.items = [T?](repeating: nil, count: count)
    self.index = 0
  }

  internal func peek() throws -> T? {

    guard !self.isEmpty else {
      throw StackError.emptyStack(reason: "Cannot peek at an empty stack!")
    }

    return self.items[self.index - 1]
  }

  internal func pop() throws -> T? {

    guard !self.isEmpty else {
      throw StackError.emptyStack(reason: "Cannot pop from an empty stack!")
    }

    self.index -= 1
    let item: T? = self.items[self.index]
    self.items[self.index] = nil
    return item
  }

  internal func push(item: T?) throws -> Void {

    guard !self.isFull else {
      throw StackError.fullStack(reason: "Cannot push into a full stack!")
    }

    self.items[self.index] = item
    self.index += 1
  }

}

internal enum StackError: Error {
  case emptyStack(reason: String)
  case fullStack(reason: String)
}
