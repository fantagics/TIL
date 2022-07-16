import UIKit

//MARK: - Control Flow
var score = 70
var test = score > 60 ? "passed" : "failed"
//: if
//if(score > 80){  // '(', ')' 생략가능
if score > 80{
    test = "A"
}else if score > 60{
    test = "B"
}else{
    test = "C"
}
//if score {   // 불가(무조건 bool타입)
//               '{' 생략불가 , '{'없이 한줄의 내용입력 불가
//: switch
switch score{
case 0:
    print("F")
    //break 자동
case 1..<91:
    print("1~90")
    
case 91..<96:
    fallthrough //break 무력화
case 96..<99:
    print("91~98")
case 99,100:
    print("A+")
    
case 101...Int.max:
    print("over 100")
default:  //default 생략불가
    print("unkown")
}
//: for-in
for i in 1...10 { // 1 ..< 11
    print(i)
}

var integers = [0, 1, 2, 3]
for i in integers{
    print(i)
}

var people = ["Mike": 10, "Merry": 20, "Sumin": 30]
for(name, age) in people{
    print("\(name) : \(age)")
}
//: while
while score > 100 {   //1 or 0 불가 => true or false
    score-=1
}
//do while문
repeat{
    score -= 10
} while score > 200

//MARK: - Collection Types
//: Array
var testArray : [Int] = []

var testArray1 : Array<Int> = Array<Int>( )
var testArray2 : Array<Int> = [Int]( )
var testArray3 : [Int] = Array<Int>( )
var testArray4 : [Int] = [Int]( )
var testArray5 : [Int] = []
var testArray6 = [Int]( )
var testArray7 = [Int](repeating: 0, count: 10)  //[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

testArray1.append(1)  //추가
testArray1.remove(at: 0)  //0번째 원소 삭제
testArray7.removeLast( )  //마지막 원소삭제
testArray1.removeAll( )  //맴버 모두삭제
testArray1.contains(1)  //멤버 포함 여부 (true/false)
testArray7[0] = 3  //수정
testArray7.insert(2, at: 1)  //삽입
print(testArray7.count)  //배열 원소 개수(배열 길이)

//: Dictionary
var testDictionary : [String:Any] = [:]

var testDictionary1 : Dictionary<String, Any> = [String:Any]()
var testDictionary2 : [String:Any] = Dictionary<String, Any>()
var testDictionary3 : [String:Any] = [:]
var testDictionary4 = [String:Any]()

testDictionary1["key1"] = "abc"
testDictionary1["key2"] = 50
print(testDictionary1)  // ["key2": 50, "key1": "abc"]
testDictionary1.removeValue(forKey : "key1")  //삭제
testDictionary1["key2"] = nil  //삭제

//: Set
var testSet : Set<Int> = Set<Int>()

testSet.insert(2)  //삽입
testSet.remove(2)  //삭제
var setA: Set<Int> = [1, 2, 3, 4]
var setB: Set<Int> = [4, 5, 6]
var unionSet: Set<Int> = setA.union(setB)  //합집합 [6, 1, 2, 4, 3, 5]
var sortedSet: [Int] = unionSet.sorted()  //정렬  [1, 2, 3, 4, 5 ,6]
var intersecSet: Set<Int> = setA.intersection(setB)  //교집합  [4]
var subtractSet: Set<Int> = setA.subtracting(setB)  //차집합  [1, 2, 3]

//MARK: - Parliamentary elections

//MARK: - Enumeration / Optional
//: Enum
enum Weekday{
    case mon
    case tue
    case wed, thu, fri, sat, sun
}

//var today: Weekday = Weekday.mon
var today = Weekday.mon
today = .wed
switch today{
case .mon, .tue, .wed, .thu, .fri:
    print("평일")
case .sat, .sun:  //맴버 모두 사용시 default생략 가능
    print("주말")
}

enum Fruits: Int { //원시값
    case apple = 0
    //case grape = 1
    case grape  //자동으로 1씩 증가함
    case carrot  //2

    func printFruit(){  //열거형 함수
        switch self {
        case .apple, .grape:
            print("과일")
        default:
            print("야채")
        }
    }
}

print(Fruits.grape.rawValue)
Fruits.carrot.printFruit()

//let banana: Fruits = Fruits(rawValue: 5) //값이 없으면 에러이기떄문에
let banana: Fruits? = Fruits(rawValue: 5) //기본 타입: Optional

if let orange: Fruits = Fruits(rawValue: 4){
    print("rawValue 4 = \(orange)")
}else{
    print("No Exist")
}
//: Optional
// 값이 있을 수도, 없을 수도 있다 (nil의 가능성 명시)
let optionalValue1: Optional<Int> = nil
var optionalValue2: Int? = 3  //?표기 띄어쓰기 불가
//optionalValue2 += 1  //기존 변수처럼 사용 불가(다른 타입)
optionalValue2 = nil

var iuoptionalValue1: Int! = 2 //암시적 추출 옵셔널
iuoptionalValue1 += 1
iuoptionalValue1 = nil
//iuoptionalValue1 += 1  //잘못된 접근 런타임 에러

//Optional Binding(옵셔널 바인딩): nil체크 + 안전한 추출
func fullName(firstName: String?,lastName: String){
  //if let fname=firstName, let lname=lastName{ //둘다 nil아닐때 실행
    if let fname = firstName{ //optional이 nil이 아닌 경우
        print(fname + lastName)
    }
    else {
        print("need first name")//optional이 nil인 경우
    }

    guard firstName != nil else{
        print("need first name")//optional이 nil인 경우
        return ;
    }
}
//Force Unwrapping(강제추출)
func printName(myname: String){ print(myname) }
var myname1: String? = "Hellen"
//printName(myname1) //에러
printName(myname: myname1!) //강제추출
var myname2: String! = "Hyun"
printName(myname: myname2) //강제추출
myname1 = nil
//printName(myname: myname1!) //값이 nil이면 런타임 에러


//MARK: - Closure : Basics
//: Closure
let added: (Int,Int) -> Int = {(a: Int, b: Int)-> Int in
    return a+b
}
print(added(2,3))


func calculated(a: Int, b: Int, method: (Int, Int)->Int)->Int{
    return method(a,b)
}
print(calculated(a: 3, b: 4, method: added))

var multiplied: Int = calculated(a: 4, b: 25, method: {(c:Int, d:Int)->Int in
    return c*d
}) //100
//후행클로저
var huhang1: Int = calculated(a: 10, b: 20){(c:Int, d:Int) -> Int in
    return c+d
}

// 반환타입 생략: calculated함수 정의부분에서 이미 반환값 정의되어있으므로 생략가능
var huhang2: Int = calculated(a: 10, b: 20){(c:Int, d:Int) in
    return c+d
}

//단축 인자이름: calculated함수 정의부분에서 이미 매게변수 타입이 정의되어있으므로 in과 함께 생략가능
var huhang3: Int = calculated(a: 10, b: 20){
    return $0 + $1
}

//암시적 반환 표현: 마지막줄 자동 리턴 (return 생략)
var huhang4: Int = calculated(a: 10, b: 20){ $0 + $1 }
