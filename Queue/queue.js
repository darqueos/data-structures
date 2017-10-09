class Queue {

  constructor(length) {
    this._items  = new Array(length);
    this._last   = length - 1;
    this._first  = 0;
    this._length = 0;
  }

  get length() {
    return this._length;
  }

  get isEmpty() {
    return this._length === 0;
  }

  get isFull() {
    return this._length === this._items._length;
  }

  peek() {

    if (this.isEmpty) {
      throw new RangeError("Cannot peek at an empty queue!");
    }

    return this._items[this._first];
  }

  dequeue() {

    if (this.isEmpty) {
      throw new RangeError("Cannot dequeue from an empty queue!");
    }

    const item = this._items[this._first];
    this._items[this._first] = undefined;
    this._first = (this._first + 1) % this._items._length;
    this._length -= 1;
    return item;
  }

  enqueue(item) {

    if (this.isFull) {
      throw RangeError("Cannot enqueue into a full queue!");
    }

    this._last = (this._last + 1) % this._items._length;
    this._items[this._last] = item;
    this._length += 1;
  }

}
