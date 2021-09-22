import UIKit
//optional 값이 있을수도, 없을 수도 있음

let optionalConstant: Int? = nil  //optionalㄷ
/*nil의 가능성을 명시적으로 표현
 문서/주석 작성 시간을 절약
 전달받은 값이 옵셔널이 아니라면 nil체크를 하지 않더라도 안심하고 사용,....
*/

// someOptionalParam can be nil
func someFunction(someOptionalParam: Int?){
    // ...
}

func somefunction(someparam: Int){
    
}

//somefunction(someOptionalParam: nil)
//somefunction(someparam: nil)

//Optional
//enum + general

//let optionalValue : Optional<Int> = nil
//let optionalValue : Int? = nil

// Implicitly Unwrapped Optional
// 암시적 추출 옵셔널
var optionalValue: Int! = 100

switch optionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// Implicitly Unwrapped Optional
// 기존 변수처럼 사용 가능
optionalValue = optionalValue + 1

optionalValue = nil

//nil 이기때문에 thread return -x
optionalValue = 0;
optionalValue = optionalValue + 1

// nil 할당가능ㅇ

var _optionalValue: Int? = 100
switch _optionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}


