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

//: 자료형
let a = 1  //let은 변경 불가 ( a=2 불가)
var b : Int = -1  // 정수
var c : UInt = 5  // 양의 정수
var d : Float = 5.0  // 32비트 부동소수형
var e : Double = 3.2  // 64비트 부동소수형
var f : Character = "a"  // 문자형, 큰따옴표 사용
var g : String = "abc"  // 문자형, 큰따옴표 사용

var h = 5 //자동 Int
var i = 5.0 //자동 Double
var j = "c" //자동 String
print(type(of: j))  //String
