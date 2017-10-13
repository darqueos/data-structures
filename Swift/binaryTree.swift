import PlaygroundSupport

class BinaryTree<T> {
    public var value: T?
    public var leftChild: BinaryTree<T>?
    public var rightChild: BinaryTree<T>?
    
    init(value: T, leftChild: BinaryTree? = nil, rightChild: BinaryTree? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}
