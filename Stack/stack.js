class Stack {

  constructor(length) {
    this.items = new Array(length);
    this.index = 0;
  }

  get length() {
    return this.index;
  }

  get isEmpty() {
    return this.index === 0;
  }

  get isFull() {
    return this.index === this.items.length;
  }

  peek() {

    if (this.isEmpty) {
      throw new RangeError("Cannot peek at an empty stack!");
    }

    return this.items[this.index - 1];
  }

  pop() {

    if (this.isEmpty) {
      throw new RangeError("Cannot pop from an empty stack!");
    }

    this.index -= 1;
    const item = this.items[this.index];
    this.items[this.index] = undefined;
    return item;
  }

  push(item) {

    if (this.isFull) {
      throw new RangeError("Cannot push into a full stack!");
    }

    this.items[this.index] = item;
    this.index += 1;
  }

}
