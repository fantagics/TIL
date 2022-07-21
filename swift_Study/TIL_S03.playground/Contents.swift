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

//MARK: - enum
//MARK: - Optional

//MARK: - Clousure
