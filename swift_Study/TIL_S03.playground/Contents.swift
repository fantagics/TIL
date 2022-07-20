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
//MARK: - Access Control
//MARK: - Protocals

//MARK: - init

//MARK: - enum
//MARK: - Optional

//MARK: - Clousure
