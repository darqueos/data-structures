// 4.0

internal enum SortOrder {
    case ascending
    case descending
}

internal final class Sort {
    private static func compare<T: Comparable>(_ v1: T, _ v2: T, _ order: SortOrder) -> Bool {
        if order == .ascending {
            return v1 < v2
        } else {
            return v1 > v2
        }
    }
}

// MARK: - SELECTION SORT

extension Sort {
    static func selectionSort<T: Comparable>(array: [T], order: SortOrder) -> [T] {
        guard !array.isEmpty else { return [] }
        var retArray = array
        
        for i in 0..<retArray.count {
            var selected = i
            for j in (i+1)..<retArray.count {
                if compare(retArray[j], retArray[selected], order) {
                    selected = j
                }
            }
            retArray.swapAt(i, selected)
        }
        
        return retArray
    }
}

// MARK: - INSERTION SORT

extension Sort {
    static func insertionSort<T: Comparable>(array: [T], order: SortOrder) -> [T] {
        guard !array.isEmpty else { return [] }
        var retArray = array
        
        for i in 1..<retArray.count {
            for j in stride(from: i, to: 0, by: -1) where compare(retArray[j], retArray[j - 1], order) {
                retArray.swapAt(j, j - 1)
            }
        }
        
        return retArray
    }
}

// MARK: - BUBBLE SORT

extension Sort {
    static func bubbleSort<T: Comparable>(array: [T], order: SortOrder) -> [T] {
        guard !array.isEmpty else { return [] }
        var retArray = array
        
        for i in 1..<retArray.count {
            for j in 0..<retArray.count - i {
                if compare(retArray[j + 1], retArray[j], order) {
                    retArray.swapAt(j, j + 1)
                }
            }
        }
        return retArray
    }
}

// MARK: - MERGE SORT

extension Sort {
    private static func merge<T: Comparable>(_ arr1: [T], _ arr2: [T], order: SortOrder) -> [T] {
        var newArray = [T]()
        var i1 = 0
        var i2 = 0
        while i1 < arr1.count && i2 < arr2.count {
            if compare(arr1[i1], arr2[i2], order) {
                newArray.append(arr1[i1])
                i1 += 1
            } else {
                newArray.append(arr2[i2])
                i2 += 1
            }
        }
        if i1 < arr1.count {
            newArray.append(contentsOf: arr1[i1...])
        } else if i2 < arr2.count {
            newArray.append(contentsOf: arr2[i2...])
        }
        return newArray
    }
    
    private static func mergeSort<T: Comparable>(array: ArraySlice<T>, order: SortOrder) -> [T] {
        guard array.count > 1 else { return [T](array) }
        let middle = (array.startIndex + array.endIndex) / 2
        let side1 = mergeSort(array: array[..<middle], order: order)
        let side2 = mergeSort(array: array[middle...], order: order)
        let ret = merge(side1, side2, order: order)
        return ret
    }
    
    static func mergeSort<T: Comparable>(array: [T], order: SortOrder) -> [T] {
        guard array.count > 1 else { return array }
        return mergeSort(array: array[0...], order: order)
    }
}

// MARK: - QUICK SORT

extension Sort {
    private func quickSort<T: Comparable>(_ array: [T], order: SortOrder = .ascending) -> [T] {
        guard array.count > 1 else { return array }
        
        let piv: T = array.first!
        var low: [T] = []
        var high: [T] = []
        
        for i in 1...(array.count-1) {
            if array[i] > piv {
                high.append(array[i])
            } else {
                low.append(array[i])
            }
        }
        
        if order == .ascending {
            var tmp = quickSort(low)
            tmp.append(piv)
            tmp.append(contentsOf: high)
            return tmp
        } else {
            var tmp = quickSort(high)
            tmp.append(piv)
            tmp.append(contentsOf: low)
            return tmp
        }
    }
}
