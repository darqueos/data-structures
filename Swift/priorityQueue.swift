// 4.0

// This implementantion depends on Binary Heap implementantion.
// See ../Heap/Heap.swift for more info

private struct QueueElement<T> {
    var priority : Int
    var element : T
    
    init(element : T, priority : Int){
        self.priority = priority
        self.element = element
    }
}

extension QueueElement: Comparable {
    static func <(lhs: QueueElement, rhs: QueueElement) -> Bool {
        return lhs.priority < rhs.priority
    }
    
    static func >(lhs: QueueElement, rhs: QueueElement) -> Bool {
        return lhs.priority > rhs.priority
    }
    
    static func ==(lhs: QueueElement, rhs: QueueElement) -> Bool {
        return lhs.priority == rhs.priority
    }
}

// MARK :- Priority Queue
internal class PriorityQueue<T> {
    private let heap = HeapTree<QueueElement<T>>(type: HeapType.minHeap)
    
    internal init(){}
    
    internal init(withArray array: [T], andPriorityArray priorities: [Int]) throws {
        guard array.count == priorities.count else {
            throw PriorityQueueError.sizesDoesNotMatch(arraySize: array.count, prioritySize: priorities.count)
        }
        for i in 0..<array.count {
            self.enqueue(element: array[i], withPriority: priorities[i])
        }
    }
}

extension PriorityQueue {
    internal func enqueue(element: T, withPriority: Int){
        heap.insert(element: QueueElement<T>(element: element, priority: withPriority))
    }
    
    internal func dequeue() -> T? {
        return heap.remove(elementAtIndex: 0)?.element
    }
    
    internal func peek() -> T? {
        return heap.root?.element
    }
}

enum PriorityQueueError: Error {
    case sizesDoesNotMatch(arraySize: Int, prioritySize: Int)
}
