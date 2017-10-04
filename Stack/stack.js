class Stack {

  constructor(length) {
    this._items = new Array(length);
    this._index = 0;
  }

  get length() {
    return this._index;
  }

  get isEmpty() {
    return this._index === 0;
  }

  get isFull() {
    return this._index === this._items.length;
  }

  peek() {

    if (this.isEmpty) {
      throw new RangeError("Cannot peek at an empty stack!");
    }

    return this._items[this._index - 1];
  }

  pop() {

    if (this.isEmpty) {
      throw new RangeError("Cannot pop from an empty stack!");
    }

    this._index -= 1;
    const item = this._items[this._index];
    this._items[this._index] = undefined;
    return item;
  }

  push(item) {

    if (this.isFull) {
      throw new RangeError("Cannot push into a full stack!");
    }

    this._items[this._index] = item;
    this._index += 1;
  }

}
