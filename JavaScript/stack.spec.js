const Stack = require('./stack');

describe('stack test', () => {
  it('should push to stack not full', () => {
    const stack = new Stack(10);
    stack.push(2);
    
    expect(stack.length).toBe(1);
    expect(stack.isFull).toBeFalsy();
  });

  it('should fill stack', () => {
    const stack = new Stack(2);
    stack.push(2);
    stack.push(42);
    
    expect(stack.isFull).toBeTruthy();
  });

  it('should fill stack', () => {
    const stack = new Stack(1);
    stack.push(10);
    
    expect(stack.pop()).toBe(10);
  });
});
