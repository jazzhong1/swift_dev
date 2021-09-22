import UIKit
//클래스는 참조타입, 낙타 표기법을 사용하여 정의

class 이름{
    //구현부
}
//프로퍼티 및 메서드 구현
/*
 클래스의 타입 메서드는 두가지 종류가 있음
 상속 후 재정의가 가능한 class 타입 메서드,
 상속 후 재 정의가 불가능한 static 메서드.

 */

class Sample{
    // 가변 프로퍼티
    var mutableProperty: Int = 100
    
    // 불변 프로퍼티
    let imutableProperty: Int = 100
    
    // 타입 프로퍼티
    static var typeProperty: Int = 100
    
    // 인스턴스 메서드
    func instanceMethod(){
        print("instance method")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod(){
        print("type method - static")
    }
    
    // 재정의 기능 타입 메서드 - class
    class func classMethod(){
        print("type method - class")
    }
}

// 클래스 사용
// 인스턴스 생성 - 참조정보 수정 가능
var mutableReference: Sample = Sample()
mutableReference.mutableProperty = 200

//불변 프로퍼티는 인스턴스 생성 후 수정 못함
//컴파일 오류 발생
//mutableReference.imutableProperty = 200

//인스턴스 생성 - 참조정보 수정 불가
let immutableReference: Sample = Sample()
immutableReference.mutableProperty = 500



