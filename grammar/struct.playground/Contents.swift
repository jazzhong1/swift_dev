import UIKit

//스위프트 대부분의 타입은 구조체로 이루어져 있음
//구조체 값 타입
//낙타표기법으로 정의한ㄷ.

/*
 struct 이름{
    //구현부
 }
 */

struct Sample{
    //가변 프로퍼티
    var mutableProperty: Int = 100
    
    //불변 프로퍼티
    let immutableProperty: Int = 100
    
    //타입 프로퍼티
    static var typeProperty: Int = 100
    
    //인스턴스 메서드
    func instanceMethod(){
        print("type method")
    }
    
    //타입 메서드
    static func typeMethod(){
        print("type method")
    }
}

// 가변 인스턴스
var mutable: Sample = Sample()

mutable.mutableProperty = 200
mutable.mutableProperty = 150
mutable.instanceMethod()
//인스턴스에서는 타입 프로퍼티나 타입 메서드를 사용 할 수 없다
Sample.typeMethod();


// 불변 인스턴스
let imutable: Sample = Sample()
//불변 인스턴스는 아무리 가변 프로퍼티라도
//인스턴스 생성 후에 수정 할 수 없다.
//ex) 학생 구조체 만들기
struct Student{
    // 가변 프로퍼티
    var name: String = "unknown"
    
    // 키워드도 '로 묶어주면 이름으로 사용 할 수 있다.
    var `class`: String = "Swift"
    
    //타입 메서드
    static func selfIntroduce(){
        print("학생타입입니다.")
    }
    
    //인스턴스 메서드
    //self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항.
    func selfintroduce(){
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

//타입 메서드 사용
Student.selfIntroduce()

//
var sungjin: Student = Student()
sungjin.name = "sungjin"
sungjin.class = "스위프트"
sungjin.selfintroduce()

//불변 인스턴스 생성
let jina: Student = Student()

//불변 인스턴스 생성
//jina.name = "qefqef" 컴파일 오류
jina.selfintroduce() 

