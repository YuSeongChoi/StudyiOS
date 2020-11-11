import UIKit

var evenNumbers: [Int] = [2, 4, 6, 8]
let evenNumbers2: Array<Int> = [2, 4, 6, 8]

evenNumbers.append(10)
evenNumbers += [12, 14, 16]
evenNumbers.append(contentsOf: [18,20])


let isEmpty = evenNumbers.isEmpty
evenNumbers.count

//print(evenNumbers.first)
//evenNumbers = [] 즉, 비어일 수 있기 때문에 Optional이다.
let firstItem = evenNumbers.first

if let firstElement = evenNumbers.first {
    print("---> first item is : \(firstElement)")
}

evenNumbers.min()
evenNumbers.max()

var firstItem2 = evenNumbers[0]
var secondItem = evenNumbers[1]
var tenthItem = evenNumbers[9]

//------>
let firstThree = evenNumbers[0...2]
evenNumbers.contains(3)
evenNumbers.contains(4)

evenNumbers.insert(0, at: 0)
evenNumbers

//evenNumbers.removeAll()
evenNumbers.remove(at: 0)
evenNumbers

evenNumbers[0] = -2
evenNumbers

evenNumbers[0...2] = [-2, 0, 2]
evenNumbers

//evenNumbers.swapAt(0, 9)

for num in evenNumbers {
    print(num)
}

for (index, num) in evenNumbers.enumerated() {
    print("idx: \(index), value: \(num)")
}

let firstThreeRemoved = evenNumbers.dropFirst(3)
firstThreeRemoved

let LastRemoved = evenNumbers.dropLast()
LastRemoved

let firstThree2 = evenNumbers.prefix(3)
firstThree2

let lastThree = evenNumbers.suffix(3)
lastThree
