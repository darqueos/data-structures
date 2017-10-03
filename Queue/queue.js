class Queue {

  constructor(length) {
    this.items  = new Array(length);
    this.last   = length - 1;
    this.first  = 0;
    this.length = 0;
  }

  get length() {
    return this.length;
  }

  get isEmpty() {
    return this.length === 0;
  }

  get isFull() {
    return this.length === this.items.length;
  }

  peek() {

    if (this.isEmpty) {
      throw new RangeError("Cannot peek at an empty queue!");
    }

    return this.items[this.first];
  }

  dequeue() {

    if (this.isEmpty) {
      throw new RangeError("Cannot dequeue from an empty queue!");
    }

    const item = this.items[this.first];
    this.items[this.first] = undefined;
    this.first = (this.first + 1) % this.items.length;
    this.length -= 1;
    return item;
  }

  enqueue(item) {

    if (this.isFull) {
      throw RangeError("Cannot enqueue into a full queue!");
    }

    this.last = (this.last + 1) % this.items.length;
    this.items[this.last] = item;
    this.length += 1;
  }

}
