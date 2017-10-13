// 4.0

internal enum HeapType {
    case maxHeap
    case minHeap
}

/// Implementation of HeapTree
internal class HeapTree <T: Comparable> {
    
    /// The array storing the Heap Tree
    private var tree: [T]
    /// Comparison closure defined through init
    private let comparison: ((T,T)->Bool)
    
    // MARK: Tree's status
    
    /// Return the number of elements in the tree
    var count: Int {
        return tree.count
    }
    
    /// Return if the tree is empty
    var isEmpty: Bool {
        return tree.isEmpty
    }
    
    /// Return the root element of the tree.
    var root: T? {
        return tree.first
    }
    
    //MARK: - Initializers
    
    /// Init
    ///
    /// - Parameter type: describes the relationship between parent and child
    init(type: HeapType = HeapType.maxHeap) {
        tree = []
        self.comparison = HeapTree.comparison(for: type, dataType: T.self)
    }
    
    /// init
    ///
    /// - Parameters:
    ///   - array: an array containing all initial elements.
    /// - Parameter type: describes the relationship between parent and child
    init(array: [T], type: HeapType = HeapType.maxHeap) {
        tree = array
        self.comparison = HeapTree.comparison(for: type, dataType: T.self)
        
        buildHeap()
    }
    
    /// MARK: - Convenience functions
    /// Print current tree
    func printTree() {
        self.tree.forEach {
            print("\($0) ", separator: "", terminator: "")
        }
    }
}

// MARK: Insertion & Removing
extension HeapTree {
    /// Inserts an element into heap tree
    ///
    /// - Parameter element: element that will be inserted into the heap tree
    func insert(element: T){
        self.tree.append(element)
        self.heapifyUp(fromIndex: self.count - 1)
    }
    
    /// Remove an element
    ///
    /// - Parameter index: index of element.
    /// - Returns: return the removed element
    func remove(elementAtIndex index: Int) -> T? {
        guard index < self.count && !self.isEmpty else { return nil }
        guard let lastElem = self.tree.last else { return nil }
        
        let ret = tree[index]
        tree[index] = lastElem
        
        let _ = tree.popLast()
        if index < self.count {
            heapifyDown(fromIndex: index)
        }
        
        return ret
    }
}

// MARK: Internal Functions
// MARK: Construction & Maintenance
extension HeapTree {
    /// Normalize heap tree from bottom-up
    ///
    /// - Parameter startingIndex: index of the first element to be normalized.
    private func heapifyUp(fromIndex startingIndex: Int) {
        guard startingIndex > 0 else { return }
        
        var i = startingIndex
        var parent = self.parent(ofIndex: i)
        
        while(i > 0 && comparison(tree[i], tree[parent])) {
            self.tree.swapAt(i, parent)
            i = parent
            parent = self.parent(ofIndex: i)
        }
    }
    
    /// Normalize heap tree from top-down
    ///
    /// - Parameter startingIndex: index of the first element to be normalized.
    private func heapifyDown(fromIndex startingIndex: Int) {
        var i = startingIndex
        
        while let sel = self.chooseBetweenChildrens(ofIndex: i) {
            if comparison(tree[sel], tree[i]) {
                self.tree.swapAt(sel, i)
                i = sel
            }
            else {
                return
            }
        }
    }
    
    /// Select child using the `comparator` passed through `init`
    ///
    /// - Parameter i: parent's index
    /// - Returns: selected child's index or nil if the parent have no child
    private func chooseBetweenChildrens(ofIndex i: Int) -> Int? {
        let left = self.leftChild(ofIndex: i)
        let right = left + 1
        
        if left >= self.count {
            return nil
        }
        else if right >= self.count {
            return left
        }
        return (comparison(tree[left], tree[right]) ? left : right)
    }
    
    /// Build heap
    private func buildHeap() {
        guard self.count >= 0 else { return }
        
        for i in stride(from: (self.count >> 1) - 1, to: -1, by: -1) {
            heapifyDown(fromIndex: i)
        }
    }
}

// MARK: Index access
extension HeapTree {
    private func parent(ofIndex i: Int) -> Int {
        return Int(i - 1) >> 1
    }
    
    private func leftChild(ofIndex i: Int) -> Int {
        return (i << 1) | 1
    }
    
    private func rightChild(ofIndex i: Int) -> Int {
        return self.leftChild(ofIndex: i) + 1
    }
}

// MARK: Constructor Helpers
extension HeapTree {
    private static func comparison<T: Comparable>(for type: HeapType, dataType: T.Type) -> ((T,T) -> Bool) {
        switch type {
        case .maxHeap:
            return (>)
        case .minHeap:
            return (<)
        }
    }
}


