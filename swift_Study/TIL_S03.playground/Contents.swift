import UIKit

//MARK: - Class
//참조가 아닌 복사, 상속 필요X
//전통적인 객체지향(OOP)
//단일상속(다중상속 불가)
//참조(reference) 타입
class ClassTest {
    var ppt1: Int = 100
    let ppt2: Int = 200  // 내부/외부에서 변경 불가
    static var typeppt: Int = 300

    func itcMethod(){print("인스턴스 메서드")}
    static func typeMethod(){print("타입 메서드, 재정의 불가")}
    class func classMethod(){print("타입 메서드(class), 재정의 가능")}
}

var mutableRef: ClassTest = ClassTest()
let immutableRef: ClassTest = ClassTest()
mutableRef.ppt1 = 101
immutableRef.ppt1 = 111  //let도 가능
ClassTest.typeMethod()
ClassTest.classMethod()

//MARK: - Principle of OOP
// * 추상화 : 객체의 공통적인 속성과 기능을 추출하여 정의
class Human {
    var name: String
    var age: Int
    init(name: String, age:Int){
        self.name = name
        self.age = age
    }
}
var minsu20 = Human(name: "MinSu", age: 20)
var mina30 = Human(name: "MiNa", age: 30)
// * 캡슐화: 데이터의 코드와 형태를 외부로부터 알 수 없게 하고, 데이터의 구조, 역할, 기능을 하나의 캡슐 형태로 만드는 방법
class Alpa{ private let secret = "비밀" }
// * 상속: 상위 클래스의 기능을 받아 재사용 하거나 새로운 기능을 하위클래스에 할 수 있음
// * 다형성: 상속받은 하위클래스가 기능을 확장하거나 변경하여 다른 여러 형태로 재구성되는 것
class Student: Human{
    func prtSelf(){print("\(self.name) / \(self.age)")}
}
//MARK: - Access Control
/*
 - private : 같은 클래스
 - fileprivate : 같은 소스 파일(.swift)
 - internal : 같은 모듈(framework) or 같은 프로젝트
 - public : 모듈 외부까지 가능
 - open : 모듈 외부, 상속 및 override가능(확장 가능)
 (선언하지 않을시 디폴트는 internal 접근 제한자)
 (주로  private, fileprivate, internal 사용)
 (open, public은 보통 오픈소스와 같은 모듈을 만드는데 사용)
 */
//MARK: - Protocals
protocol RuleA {
    //프로퍼티 요구(항상 var)
    // get: 읽기 가능 , get set: 읽기 쓰기 가능
    var ptcA: String { get set }
    var ptcB: String { get }
    func ptcFC() //메서드 요구 //구현X 정의만 가능
    init(ptcA: String, ptcB: String) //이니셜라이저 요구
}
struct StructTwo: RuleA{ //프로토콜 채택
//    var ptcA: String //get set => var (읽기쓰기 가능해야함)
//    let ptcB: String //let 읽기만 가능
    
    //읽기전용 프로퍼티 요구는 연산 프로퍼티로 대체 가능
    var ptcB: String { return "읽기전용" } //{ get{ return "읽기전용" }}
    //읽기쓰기 프로퍼티도 연산프로퍼티 가능
    var ptcD: String = ""
    var ptcA: String{
        set{ self.ptcD = newValue }
        get{ return self.ptcD }
    }
    func ptcFC() { print("메서드구현") }
    init(ptcA: String, ptcB: String){
        self.ptcA = ptcA
    }
}

protocol RuleB { func funcB() }
protocol RuleC { func funcC() }
protocol RuleD: RuleB { // 상속
    func funcD()
}
protocol RuleE: RuleB, RuleC { //다중상속
    func funcE()
}


// class 상속의 경우 상속받을 클래스 먼저, 상속받을 프로토콜 순으로 상속
class PtcCsOne:RuleB{
    func funcB() { print("B") }
    var one:Int = 0
}
class PtcCsTwo: PtcCsOne, RuleE{
    func funcC() { print("C") }
    func funcE() { print("E") }
}


// is, as로 준수하는 프로토콜 확인 가능
var ptcCsA:PtcCsOne = PtcCsOne()
var ptcCsB:PtcCsTwo = PtcCsTwo()
var ptcAnyone: Any = ptcCsA
ptcAnyone is RuleB //true
ptcAnyone is RuleE //false
ptcAnyone = ptcCsB
ptcAnyone is RuleB //true
ptcAnyone is RuleE //true
if let ableRuleB: RuleB = ptcAnyone as? RuleB{
    ableRuleB.funcB()
} // B

//MARK: - init
class SampleOne{
    //var one: Int  //불가
    var one: Int = 0
    var two: String = ""
}
class SampleTwo{
    var one: Int
    var two: String
    //이니셜라이저
    init(a: Int, b: String){
        self.one = a
        self.two = b
    }
}
let jinwoo: SampleTwo = SampleTwo(a: 21, b: "JinWoo")

class SampleThree{
    var one: Int
    var two: String?  //Optional : 필요할수도 안할수도
    init(one:Int){
        self.one = one
    }
    convenience init(one: Int, two: String){
        self.init(one: one)  //자신의 init을 호출할 떄 convenience필요
        self.two = two
    }
}
let youjin: SampleThree = SampleThree(one: 23) //one=23, two=nil

class SampleFour{
    var one: Int
    var two: SampleThree!  //암시적 추출 옵셔널 : 값이없을수도있지만 필요한존재
    init(one:Int){
        self.one = one
    }
    func printSample(){
        print("one: \(one), two: \(two.one)")
    }
}
let poppy: SampleFour = SampleFour(one: 3)
//poppy.printSample()  //=에러
poppy.two = youjin
poppy.printSample()

//MARK: - enum
// 자체가 하나의 데이터 타입, case 하나하나 전부 유의미한 값 취급
// 상속 불가
// 값(value)타입
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

enum AlpabatF:String, CaseIterable{
    case aaa = "AAA"
    case bbb = "BBB"
    case ccc = "CCC"
}
for i in AlpabatF.allCases {
    print(i, i.rawValue)
}
enum AlpabatS: Int, CaseIterable{
    case aaa
    case bbb
    case ccc
var name: String{
        switch self{
            case .aaa:
                return "AAA"
            case .bbb:
                return "BBB"
            case .ccc:
                return "CCC"
        }
    }
}
for i in AlpabatS.allCases {
    print(i, i.rawValue)
}
    
//MARK: - Optional
//: 값이 있을 수도, 없을 수도 있다 (nil의 가능성 명시)
var optionalValue: Int?

let optionalValue1: Optional<Int> = nil
var optionalValue2: Int? = 3  //?표기 띄어쓰기 불가
//optionalValue2 += 1  //기존 변수처럼 사용 불가(서로 다른 타입임)(Optional 타입)
optionalValue2 = nil

//- 옵셔널 해제하는 방법 3가지
//  * Optionsl Binding(if let)
//  * Forced Unwrapping(!)
//  * Early Exit(guard let)
//  * Chaining(a?.b?.c?)


// Optional Binding(옵셔널 바인딩) : nil 체크 + 안전한 추출
// if let int = int? { … }
func fullName(firstName: String?,lastName: String){
  //if let fname=firstName, let lname=lastName{ //둘다 nil아닐때 실행
    if let fname = firstName{ //optional이 nil이 아닌 경우
        print(fname + lastName)
    }
    else {
        print("need first name")//optional이 nil인 경우
    }
}


//Forced Unwrapping(강제 추출) : 옵셔널 값을 옵셔널이 아닌 값으로 추출
// : ‘!’ 를 붙여 사용( 런타임 오류가 일어날 가능성이 높아, 위험한 방법임)
var optionalValue3: String?
optionalValue3 = "Hello"
var notOptionalValue: String = optionalValue3!
optionalValue3 = nil
//notOptionalValue = optionalValue3!  //error
func printName(_ name: String){
    print(name)
}

var optName: String? = "Alpa"
//printName(optName)   //error
printName(optName!)  //강제추출

var forcName: String! = nil
//printName(forcName)   //error
forcName = "Beta"
printName(forcName)  //강제추출


//Early Exit (guard)
func earlyExit(a: Int){
    guard a < 0 else{ return }
}


//옵셔널체이닝 : 옵셔널체이닝 (nil 판단)
class PersonA{
    var name: String
    var job: String?
    var home: ApartmentA?
    init(name: String){ self.name=name }
}
class ApartmentA{
    var dong: String
    var hosu: String
    var managerA: PersonA?
    var ownerA: PersonA?
    init(dong:String, hosu:String){
        self.dong=dong
        self.hosu=hosu
    }
}
let gaga: PersonA? = PersonA(name: "GaGa")
let hyendae: ApartmentA? = ApartmentA(dong: "103", hosu: "502")
let nana: PersonA? = PersonA(name: "NaNa")

// 옵셔널체이닝 사용전
func managerAJob(owner: PersonA?){
    if let owner = owner { //owner != nil
        if let home = owner.home { // owner.home != nil
            if let manager = home.managerA{
                if let job = manager.job{
                    print("owner의 집의 관리자의 직업은 \(job)")
                }
                else{
                    print("owner의 집의 관리자의 직업은 존재안함(nil)")
                }
            }
        }
    }
}

//옵셔널체이닝 사용후
func managerBJob(owner: PersonA?){
    if let job = owner?.home?.managerA?.job { //앞에서부터 순차적으로 확인
        print("owner의 집의 관리자의 직업은 \(job)")
    }
    else{
        print("owner의 집의 관리자의 직업은 존재안함(nil)")
    }
}
gaga?.home = hyendae
gaga?.home?.managerA = nana
nana?.job = "경비원"
managerBJob(owner: gaga) //owner의 집의 관리자의 직업은 경비원

//nil병합
print(gaga?.job ?? "개발자") //gaga?.job이 nil이면 "개발자"를 리턴

//MARK: - Clousure

// (함수 = 클로저의 일종)
// func myFunc(){  } //이름 있는 클로저
// {  } //이름 없는 클로저

//클로저
//  * 실행가능한 코드블럭 / 이름없는 함수
//  * (함수의 전달인자로 자주 사용
//  * 참조(reference) 타입
//  * 매개변수 참조 캡쳐
let added: (Int,Int) -> Int = {(a: Int, b: Int)-> Int in
    return a+b
}
print(added(2,3))

func calculated(a: Int, b: Int, method: (Int, Int)->Int)->Int{
    return method(a,b)
}
print(calculated(a: 3, b: 4, method: added)) //매개변수로 함수: '()'사용X

var multiplied: Int = calculated(a: 4, b: 25, method: {(c:Int, d:Int)->Int in
    return c*d
}) //100

var voidFunc: (String)->Void = { value in
    print(value)
}

// - 후행클로저
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


// in / out
var num = 1
func add(value:Int){  //value는 let타입
    //value += 1 //error
}
func add2(value:inout Int){
    value += 1
}
add2(value: &num) //주소를 받아옴
