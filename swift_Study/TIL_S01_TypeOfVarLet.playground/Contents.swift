import Swift
//: ## 변수명
//: * Lower Camel Case : 함수, 메서드, 변수, 상수
//: * Upper Camel Case : 타입( 클래스, 구조체, enum, extension)
//var `class`: Int = 5 //그레이브 액센트(`)로 이미 존재하는 메서드를 변수명으로 사용할수있다.

//: 출력
var name = "Minsu"
print(name)
dump(name)
print("My name is \(name).")

//: var, let
let a = 1
//a = 2  //let은 변경 불가
var aa = 1
aa = 2

//: 타입추론(Type Inference) : 자료형 타입 추론
let one = 5 //Int
let two = 3.4 //Double
let three = "A" //String
print(type(of: three))  //String
//: 타입어노테이션(Type Annotation): 자료형 직접 표기
let four: String = "Hello, Swift!"

//: 자료형
var b : Int = -1  // 정수
var c : UInt = 5  // 양의 정수
var d : Float = 5.0  // 32비트 부동소수형
var e : Double = 3.2  // 64비트 부동소수형
var f : Character = "a"  // 문자형, 큰따옴표 사용
var g : String = "abc"  // 문자형, 큰따옴표 사용

//: optional ?
var h: Int? = nil
h = 2
//h + 3  //옵셔널 타입과 Int타입 연산 불가

var str1 = "Hello"
var str2 = "Swift"
print(str1+str2)  //str1 - str2 빼기는 불가

var arr: [Int] = [1, 2]  //같은 1가지 타입만 포함가능한 배열



var num1 = 3
var num2 = 5
//:함수
func addTwo1(num1:Int, num2: Int){
    print(num1 + num2)
}
addTwo1(num1: num1, num2: num2)

func addTwo2(num1 value1:Int, num2 value2: Int){
    print(value1 + value2)
}
addTwo2(num1: num1, num2: num2)

func addTwo3(_ value1:Int, _ value2: Int){
    print(value1 + value2)
}
addTwo3(num1, num2)
