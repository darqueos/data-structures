const Queue = require('./queue');

describe('queue test', () => {
  it('should enqueue', () => {
    const queue = new Queue(1);
    queue.enqueue('item');
    
    expect(queue.dequeue()).toBe('item');
    expect(queue.isEmpty).toBeTruthy();
  });
});
