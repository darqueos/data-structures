import Foundation

internal final class Queue<T> {
    private var items: Array<T?>
    
    internal init() {
        self.items = []
    }
    
    internal func isEmpty() -> Bool {
        return self.items.count == 0
    }
    
    internal func peek() throws -> T? {
        guard !self.isEmpty() else {
            throw QueueError.emptyQueue(reason: "Cannot peek at an empty queue!")
        }
        
        return self.items.first as? T
    }
    
    internal func pop() throws -> T? {
        guard !self.isEmpty() else {
            throw QueueError.emptyQueue(reason: "Cannot pop at an empty queue!")
        }
        
        let item: T? = self.items.first  as? T
        self.items.remove(at: 0)
        return item
    }
    
    internal func push(item: T?) throws -> Void {
        self.items.append(item)
    }
    
    internal func size() -> Int {
        return self.items.count
    }
}

internal enum QueueError: Error {
    case emptyQueue(reason: String)
}
