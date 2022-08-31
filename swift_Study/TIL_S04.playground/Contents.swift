import UIKit

//forEach , map , filter , reduce

var numbers = Array(1...100)

//forEach
numbers.forEach{
    print($0)
}

//map
var doubleNumbers: [Int] = []
for number in numbers{
    let doubleNumber = number * 2
    doubleNumbers.append(doubleNumber)
}
//numbers.map{ //number in
//    //return number * 2
//    $0 * 2
//}
print(numbers.map{$0 * 2})

//filter
var higherThanFifty: [Int] = []
//for number in numbers {
//    if number > 50 {
//        higherThanFifty.append(number)
//    }
//}
//for number in numbers where number > 50 {}
print(numbers.filter{ $0 > 50 })


//reduce
var sum = 0
for number in numbers{
    sum += number
}
//numbers.reduce(0){ partialResult, number in
//    partialResult + number
//}
print(numbers.reduce(0){$0 + $1})
