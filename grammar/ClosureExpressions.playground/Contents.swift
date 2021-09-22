import Foundation

/*
 Closures
 코드블럭으로 C, Objcetive-C의 블럭(Blocks)과, 람다 언어랑 비슷.
 비동기?? 코드..비슷..
 
 어떤 let, var의 참조를 캡처(Capture)해 저장 할 수있다..
 Swift는 이 캡쳐와 관련한 모든 메모리를 알아서 관리..
 
 
 전역 함수(global functions) : 이름이 있고 어떤 값도 캡쳐하지 않는 클로저
 중첩 함수(nested function) : 이름이 있고, 관련한 함수로 부터 값을 캡쳐 할 수 있는 클로져
 
 클로저 표현 : 경량화 된 문법으로 쓰여지고 관련된 문맥(context)로 부터 값을 캡쳐 할 수 있는 이름이 없는 클로저
 
 swift 최적화의 내용.
 1. 문맥(context)에서 인자 타입(parameter type)과 반환타입(retun type)의 추론.
 2. 단일 표현 클로저에서 암시적 반환.
 3. 축약된 인자 이름.
 4. 후위 클로저 문법.
 */

/*
 클로저 표현 (Closure Expressions)
 인라인 클로저를 명확하게 표현하는 방법으로 문법에 초점이 맞춰저 있음.
 클로저의 표현은 코드의 명확성, 의도를 읺지 않으면서 문법을 축약해 사용할 수 있는
 다양한 문법의 최적화 제공.
 */

/*
 정렬 메소드(The Sorted Method)
 Swift 표준 라이브러리에 sorted(by:)라는 타입의 배열값을 정렬하는 메소드를 제공.
 by 에 어떤 방법으로 정렬을 수행할건지에 대해 기술한 클로저를 넣으면 그 방법대로 정렬된
 배열을 얻을 수 있다.
 sorted(by : )메소드는 원본 배열은 변경하지 않는다
 ex.... names배열을 sorted(by : )메소드와 클로저를 이용하여 정렬..
 */
var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//sorted(by : ) 메소드는 배열의 콘텐츠와 같은 타입을 갖고 두개의 인자를 같은 클로저 인자로 사용해얗안다.
//name의 콘텐츠는 String  타입이므로 (String, String )->Bool타입의 클로저를 사용해야함

//클로저를 제공하는 일반적인 방법은 함수를 하나 만드는것.
var count : Int = 0;
func backward(_ s1 : String, _ s2 : String ) -> Bool{
    count += 1
    print("check count \(count)")
    print("check s1 \(s1)")
    print("check s2 \(s2)")
    return s1 > s2
}
print("before sorted \(names)")
var reversedNames = names.sorted(by: backward)
print("after sorted \(reversedNames)")


/*
 클로저 표현 문법(Clsure Expression Syntax)
 클로저 표현 문법은 일발적으로 ..
 { (parameters) -> retun type in
 statements
 }
 
 인자로 넣을 parameters,
 인자 값으로 처리할 내용을 기술하는 statements 그리고
 return type.
 
 앞의 backwrard 클로저를 이용해 배열을 정렬하는 코드는 클로저 표현을 이용해 바꿀수 있음
 
 */

let reversedNames2 = names.sorted { (_ s1 :String, _ s2 : String) -> Bool in
    return s1 < s2
}
print("inline closure \(reversedNames2)")

/*
 인자로 들어가있는 형태의 클로저를 인라인 클로저라고 부른다.
 body는 in 키워드 다음에 시작한다.
 사용할 인자 값과(parameters), 반환타입(return type)을 알앙ㅆ으니
 그것들을 적절히 처리해 넘겨 줄 수 있다는 뜻.
 //한줄로도 사용가능.
 ex)  가독성 떨어짐...
 let reversedNames2 = names.sorted { (_ s1 :String, _ s2 : String) ->Bool in return s1 < s2}
 */


/*
 문맥에서 타입추론 (Inferring Type From Context)
 String 배열에서 sorted(by : ) 메소드의 인자로 사용된다.
 sorted(by:)의 메소드에서 이미 (String, String) -> Bool 타입의 인자가 들어와야 하는지
 알기 때문에 클로저에서 이 타입이 생략 될 수 있다.
 ex) 가독성 떨어짐...
 let reversedNames = names.sorted(by : { s1, s2 in return s1 > s2})
 
 */

/*
 단일 표현 클로저에서의 암시적 반환(Implicit Returns From Single-Express closures)
 단일 표현 클로저에서 반환 키워드 생략 가능.
 let reversedName3 = names.sorted(by: {s1,s2 in s1 > s2})
 두 값을 인자로 받아 결과 반환
 */


/*
 인자 이름 축약(Shorthand Argumentes Names)
 Swift 인라인 클로저에서 자동으로 축약 인자이름을 제공.
 이 인자를 사용하면 값을 순서대로 $0, $1, $2 등으로 사용할 수 있다.
 축약 인자 이름을 사용하면 인자값과 그 인자를 처리할 떄 사용하는 인자가 같다는걸 안다.
 인자를 입력받는 부분과, in키워드를 생락 할 수 있으며 축약 가능함...
 
 가독성 떨어짐.
 let reversedName4 = names.sorted(by: {$0 > $1})
 축약은 되었지만 논리를 표현하는데 지장이 없음.
 인라인 클로저에 생략된 내용을 포함해 설명하면
 $0, $1 인자 두개를 받아서 $0이 $1 보다 큰지 비교하고 Bool을 반환해라 ...
 
 */

/*
 연산자 메소드 (Operator Methods)
 Swift의 String타입 연산자에는 String끼리 비교할 수 있는 비교연산자 (>)를 구현함.
 그냥 이 연산자를 사용하면 끝..?
 let reversedNames5 = names.sorted(by: >)
 ....
 */


/*
 후위 클로저 (Trailing Closures)
 함수의 마지막 인자로 클로저를 넣고, 클로저가 길다면 후위 클로저를 사용 할 수있다.
 이런 형태의 함수 클로저가 있으면 ..
 */
func someFunctionThatTakesAClosure(closure : () -> Void){
    // function body goes here
}

//위 클로저의 인자 값 입력 부분과 반환 형 부분을 생략해 다음과 표현 가능.
someFunctionThatTakesAClosure(closure: {
    
})

//후위 클로저로 표현하면 함수를 대괄호 ({,})로 묶어 그 안에 처리할 내용을 적으면 가능
//모르고 사용할 경우 전역함수 형태가 사실 클로저로 사용하고 있었음.
someFunctionThatTakesAClosure {
    //....전역함수?
}

//정렬 예제를 후위 클로저를 이용해 표현하면
var reversedName6 = names.sorted(){ $0 > $1}

//만약 함수의 마지막 인자가 클로저이고, 후위 클로저를 사용하면 괄호() 생략 가능
reversedName6 = names.sorted{ $0 > $1}

//후위 클로저를 이용해 Int, String으로 매핑 하는 예제.
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map{ (number) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10 ]! + output
        //dictionary 의 subScript는 옵셔널 이기 떄문에 key값이 있을수도 , 없을 수도 있음....
        number /= 10
    }while number > 0
    return output
}
print("check strings \(strings)")


/*
 값 캡쳐 (Capturing Values)
 클로저는 특정 문맥의 상수, 변수의 값을캡쳐 할 수 있따.
 원본 값이 사라져도 클로져의 body안에 그 값을 활용 할 수있다.
 Swift에서 값을 캡처하는 가장 단순한 형태는
 중첩 함수(nested function) 중첩함수는
 함수의 body에서 다른 함수를 다시 호출한 형태로 된 함수.
 */

func makeIncremeter(forIncrement amount : Int) -> () -> Int {
    var runningTotal = 0
    print("check amout \(amount)")
    
    func incremeter () -> Int{
        print("check runningTotal \(runningTotal)")
        runningTotal += amount
        print("check runningTotal + amount \(runningTotal)")
        return runningTotal
    }
    /*
     runningTotal 과 amount도 없음. 하지만 돌아감 runnningTotal, amout가 캡처링 되서  돌아가는 형태임
     최적화 이유로 Swift는 만약 더이상 클로저에 의해 값이 사용되지 않는 경우 그 값을 복사해 저장하거나, 캡처링 하지 않음,
     Swift는 또 특정 변수가 더이상 필요하지 않을 경우 ARC에 의해 제거하겠지....
     
     */
    
    
    return incremeter
}
/*
 makeIncremeter 함수 안에서 incremeter함수를 호출하는 형태로 중첩 함수이다.
 클로저의 인자와 반환값이 보통의 경우 달라 ....보이나
 쪼개어 본다...
 인자와 반환값 (forIncrement amout : Int) -> () -> 중 처음 ->를 기준으로
 앞의 (forIncrement amout : Int) = 인자.
 뒤 () -> Int 반환 값.
 즉 반환값이 클로저인 형태. () -> Int 파라메터가 없고, Int를 반환하는 function pointer..
 
 
 */
//중첩 함수 실행, makeIncremeter 함수를 실행하는 메소드를 반환함.
let incrementByTen = makeIncremeter(forIncrement: 10)
var myTenValue : Int! = incrementByTen()
//10 반환
myTenValue +=  incrementByTen()
//20 반환
myTenValue += incrementByTen()
//30 반환
//함수가 각기 실행되지만 실제로는 변수 runningTotal, amount가 캡처링 되서 그 변수를
//공유하기 떄문에 계산이 누적된 결과를 갖는다.
print("check my TenValue \(String(describing: myTenValue))")

//새로운 클로저를 생성해도 마찬가지.
let incrementBySeven = makeIncremeter(forIncrement: 7)
incrementBySeven() //7 리턴.

/*
 클로저를 어떤 클래스 인스턴스의 프로퍼티를 할당하고, 그 클로저가 인스턴스를 캡처링하면
 강한 순환참조에 빠지게 된다, 즉 인스턴스의 사용이 끝나도 메모리 해제를 하지 못하는 상황임
 그래서 swift는 이 문제를 다루기 위해 캡처 리스트(capture list)를 사용한다
 */

/*
 클로저는 참조타입(Closure Are Referenc Types)
 incrementBySeven 과 invrementByTen은 상수이다.
 runningTotal변수를 계속 증가 시킬까
 ReferenceType이기 때문에 가능하다.
 함수와 클로저를 상수나 변수에 할당할떄  실제로는 상수와 변수에 해당함수나 클로즈이 참조가 할당됨
 그래서 만약 한 클로저를 두 상수나 변수에 할당하면 두 상수나 변수는 같은 클로저를 참조하고 있다.
 C, C++에서 함수포인터를 저장한다고 볼 수 있다.
 */

/*
 이스케이핑 클로저(Escaping Clousre)
 클로저를 함수의 파라메터로 넣을수 있는데,
 함수 밖(함수가 끝나고 실행되는 클로저)
 ex)비동기, completionHanlder로 사용되는 클로저는 파라미터 타입앞에
 @escaping 이라는 키워드를 명시해야한다.
 */
var completionHandlers : [() -> Void] = [] //함수포인터 배열.
func someFunctionWithEscapingClosure(completionHandler : @escaping() -> Void){
    completionHandlers.append(completionHandler)
}

/*
 위 함수에서 인자로 전달된 completionhandler는 someFunctionWithEscapingClosure 함수가 끝나고 나중에 처리된다.
 만약 함수가 끝나고 실행되는 클로저는 @escaping 키워드를 붙이지 않으면 컴파일시 오류가 발생
 @escaping을 사용하는 클로저는 self를 명시적으로 언급해야한다.
 */
//ex)

func someFunctionWithNonescapingClosure(closure : () -> Void){
    closure()
}

class someClass{
    var x = 10
    func doSomething(){
        someFunctionWithEscapingClosure {
            print("someFunctionWithEscapingClosuer")
            self.x = 100
        }
        someFunctionWithNonescapingClosure {
            print("someFunctionWithNonescapingClosure")
            x  = 200
        }
    }
}

let instance = someClass()
instance.doSomething()
instance.doSomething()
//someFunctionWithNonescapingClouser 배열안으로 들어간다.
print("check completionHandler count \(completionHandlers.count)")
print("check insstance \(instance.x)")

/*print(instance.x)

completionHandlers.first?()
print(instance.x)
*/


/*
 자동클로저 (AutoClouser)
 자동클로저는 인자값이 없으며 특정표현을 감싸서 다른 함수에 전달 인자로 사용하는 클로저.
 자동클로저는 클로저를 실행하기 전까지 실제 실행되지 않는다.
 계산이 복잡한연산을 하는데 유용하다. 실제 계산이 필요할때 호출되기 떄문.
 //지연호출...어떨때 사용가능할ㄲ?
 */
//ex)
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print("check customerInLine count \(customersInLine.count)")

let customerProvider = { customersInLine.remove(at: 0)}
//AutoClouser...
print("check customerInLine count \(customersInLine.count)")

print("Now serving \(customerProvider())!") //첫번쨰 인덱스 제거 후 출력.
print("check customerInLine count \(customersInLine.count)") //size = 4
/*
 let customerProvider  = { customerInLine.remove(at : 0)} 이 클로저 코드를
 지났어도 cusotmerInLine.count는 변함없이 5 인것을 확인.
 클로저를 실행시킨 print("Now serving \(customerProvider())!") 이후에야 배열 값이
 하나 제거되어 배열의 원소개수가 4로 줄어든것 확인.
 이렇듯 자동클로저는 적혀진 라인 순서대로 바로 실행되지 않고 실제 사용될때 지연호출.....
 */
//자동 클로저를 함수의 인자값으로 넣는 예제.
func serve(customer customerProvider: () -> String){
    print("now serving \(customerProvider())!")
}
serve(customer: {customersInLine.remove(at: 0)})


func serve(customer customerProvider: @autoclosure () -> String){
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))

/*
serve 함수는 인자로 () -> String 형, 즉 인자가 없고, String 을 반환하는 클로저를 받는 함수.
 이 함수를 실행할떄는 serve(customer: { customerInLine.remove(at : 0)})
 이와같이 클로저를 명시적으로 직접 넣을 수 있다.
 
 autoclouser 키워드를 이용하여 보다 간결할게 사용 가능하다.
 자동으로 클로저로 변환되나.
 
 함수의 인자 값을 넣을 떄 클로저가 아니라 클로저가 반환하는 값과 일치하는 형의 함수를 인자로 넣을수 있따.
 server(customer : { customersInLine.remove(at : 0)}) 이런 코드를
 @autoclosuer 키워드를 사용했기 떄문에 server(custom: customerInLine.remove(at : 0))이 {} 없이 사용 가능하다.
 즉 @autoclouse 를 선언하면 함수가 이미 클로저 인것을 알기 떄문에
 리턴값 타입과 같은 값을 넣어 줄 수 있다.
 
 NOTE 자동 클로저를 남발하면 코드 가독성이 떨어짐, 문맥과 함수 이름이 autoClosure를 사용하기에 분명 해야함.
 */

//자동클로저는 @autoclosure는 이스케이프 @escaping와 같이 사용 할 수 있다.
//ex) @autoclosuer, @escaping 혼용
print("check customerInLine \(customersInLine)") //["Barry", "Daniella"]

var customerProviders : [() -> String] = [] //클로저 저장하는 배열.
func collectCustomerProviders(_ customerProvider : @autoclosure @escaping () -> String){
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.") //excpect 2

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())")
}
print("check customersInLine coutn \(customersInLine.count)")
/*
 collectCustomerProviders 함수의 인자 customerProvider 는
 @autoclouser이면서,
 @escaping으로 선언 되어 있다.
 
 @autoclosuer로 선언됐기 때문에 함수 인자로 리턴 값 String만 만족하는
 customersInLine.remove(at : 0)형태로 함수 인자에 넣을 수 있고, 이 클로저는
 collectCustomerProviders 함수가 종료된 후에 실행되는 클로저 이기 때문에
 앞에 @escaping 키워드를 붙여줌....
 
 */


























