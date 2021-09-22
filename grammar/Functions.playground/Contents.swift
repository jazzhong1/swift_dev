import Foundation

//정의와 호출(Defining and Calliong Function)
/*
 func 키워드 붙이고 (persion : String) 파라메터
 ->String 형태 반환형
 */

func greet(person: String)->String{
   let greeting = "Hello, " + person + "!"
    return greeting
}

func greetingAgain(person: String) -> String{
    return "Hello, " + person + "!"
}

//인자값 넣어 호출 한
print(greet(person: "jazzhong1"))
print(greet(person: "jazzhong2"))


//파라메터 없는 함수 (Function Without pararmeters)
func sayHelloWorld() -> String{
    return "hello world"
}
print(sayHelloWorld())



//복수의 파라메터 사용하는함수(Function with Mulitple Parameter)
func greet(person : String , alreadyGreeted : Bool) -> String{
    if alreadyGreeted {
        return greetingAgain(person: person)
    }
    return greet(person: person)
}
print(greet(person: "Tim", alreadyGreeted: true))





//반환값이 없는 함수 (Functions Without Return Values)
func greetVoid(person: String) {
    print("Hello, \(person)!")
}
greetVoid(person: "Dave")
/*
 반환 값이 정의 되지 않는 함수는 Void라는 특별한 형을 반환.
 Void는 간단히 ()빈 튜플...
 */




func printAndCount(str : String) -> Int{
    print(str)
    return str.count
}

func printWithoutCounting(str : String){
    let _ = printAndCount(str: str)
}
printAndCount(str: "hello world")
printWithoutCounting(str: "hello world")




//복수의 값을 반환하는 함수(Functions with Multiple Return Values)
//튜플 반환의 경우 사용가능..
func minMax(array : [Int]) -> (min: Int, max : Int){
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count]{
        print("check value \(value)")
        if value < currentMin{
            currentMin  = value
        }
        else if value > currentMax{
            currentMax = value;
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71].sorted())
print("min is \(bounds.min) and max is \(bounds.max)")





//옵셔널 튜플 반환형(Optional Tuple Retun Types)
//위의 반환값과 달리 반환값에 ? 붙을경우 (min: Int, max: Int)?
func minMaxOptional(array : [Int]) -> (min: Int, max : Int)?{
    if array.isEmpty { return nil }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
}
/*실제 반환값에 접근하기위해서는 if let과 같은 옵셔널 체인을 사용 ,
 강제 unwrapping해야함...
 */
//옵셔널 체이닝 예제.
if let bounds = minMaxOptional(array: [8, -6, 2, 109, 3, 71].sorted()){
    print("min is \(bounds.min) and max is \(bounds.max)")
}





//함수 인자 라벨과 파라메터 이름(Function Argument Labels and Prameter Names)
//함수 호출시 적절한 파라미터 이름을 지정해 함수 내부와 함수 호출시 사용가능.
func someFunction(firstParameterName : Int, secoundParameterName : Int){
    //함수 내부에서 firstParameterName, secoundParamterName 인자를 사용
}
someFunction(firstParameterName: 1, secoundParameterName: 2)



//인자 라벨 지정(Specifying Arguments Labels)
/*
 파라메터 앞에 인자 라벨을 지정해 실제 함수 내부에서
 해당인자를 식별하기위한 이름과,
 함수 호출시 사용하는 인자 이름을 다르게 사용가능.
 고객 사용시... 함수명 감추기위해 사용 가능할듯.
 */
func someFunctionSpecifyiing(argumentLabel parameterName : Int){
    print("check argumentLabel \(parameterName)")
}
//someFunctionSpecifyiing(argumentLabel: <#T##Int#>) ? 이런식..

func greet(person : String , from hometown : String) -> String{
    //hometown을 인자값으로 사용.
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}

print(greet(person: "Bill", from: "Cupertino"))


//인자 생략(Omittiing Argument Labels)
//파라메터 앞에 _ 를 붙여 함수 호출시 인자값 생략 가능
//파라메터 명을 생략한다는거 같음...바인딩 사용불가?
func someFunction(_ firstParameterName : Int , secondParameterName : Int){
    // 함수 안에서 firstParameterName, secondParameterName
    // 인자로 입력받은 첫번째, 두번째 값을 참조합니다
}
someFunction(123, secondParameterName: 333)



//기본 파라메터 값(Default Parameter Values)
/*
 함수의 파라미터 가본값 ( : Int = 12)를 설정 할 수 있다.
 기본 값이 설정되엉 있는 파라미터는 함수 호출시 생략할 수 있다.
 기본 값을 사용하지 않는 파라메터는 앞에 위치시켜야 함수를 의미있게 사용하기 쉽다...
 */
func someFunction(parameterWithoutDefult : Int, parameterWithDefault : Int = 12){
    print("parameterWithoutDefault\(parameterWithoutDefult),")
    print("parameterWithDefault \(parameterWithDefault)")
}
someFunction(parameterWithoutDefult: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefult: 33)


//집합 파라메터(Variadic Parameter)
//인자 값으로 특정 형(type)의 집합값을 사용할 수 있다...
func arithmeticMean(_ numbers : Double ...) -> Double{
    var total : Double  = 0
    for number in numbers{
        total += number
    }
    return total / Double(numbers.count)
}
var resValue =  arithmeticMean(1, 2, 3, 4, 5)
print("resValue \(resValue)")
resValue = arithmeticMean(3,8.25,18.75)
print("resValue \(resValue)")


//인 - 아웃 파라메터 (In-Out Parameters)
//파라메터 두개 돌려줄떄 사용하면 좋을것? 같은데...
//키쌍..같은.
/*
 인자 값을 직접 변경하는 파라메터.
 선언을 위해 파라메터 앞에 intout 이라는 키워드를 사용하여 사용.
 주의!! 파라미터는 기본값을 가질 수 없고 집합 파라미터는 inout으로 선언 될 수 없다.
 인-아웃 파라미터를 사용하는 것은 함수의 반환값을 사용하지않고 함수 scope밖에 영향을 줄 수 있는
 또 하나의 방법.....
 */
func swapTwoInts(_ a : inout Int, _ b : inout Int){
    let tempA  = Int(123)
    let tempB = Int(456)
    let temporaryA = a
    a = b
    b = temporaryA
    
    a = tempA //안바뀌는데?..
    b = tempB //안바뀌는데?..
}
//함수의 인자에 변수를 넣을때 &키워드를 넣어 사용
//포인터 넣는다고 생각...
var someInt  = 3
var anotherInt  = 107

swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")




//함수 형(Function Type)
/*
 함수의 형은 파라미터 형과(parameter type), 반환 형(return Type)으로 구성되어있다.
 Int 값 두개를 입력받고, Int를 반환하는 함수.
 */
func addTwoInts(_ a: Int, _ b : Int) -> Int{
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b : Int) -> Int{
    return a * b
}

//함수 형의 사용(Using Function Types)
//아래와 같이 함수를 변수처럼 정의하여 사용 할 수 있다.
var mathFunction : (Int, Int) -> Int = addTwoInts
print("mathFunc = addTwoInts \(mathFunction(2,3))");

mathFunction = multiplyTwoInts
print("mathFunc = multiplyTwoInts \(mathFunction(2,3))");

//var or let에 함수를 할당해 직접 형을 선언하지 않아도
//swift가 형을 추론(Type Infferred)자동으로 함수를 할당 할 수 있다.
let anotherMathFunction = addTwoInts







//파라메터 형으로써의 함수 형(Function Types as Parameter Types)
//파라메터에 함수 형을 사용할 수 있다.
func printMathResult(_ mathFunction: (Int, Int)-> Int, _ a: Int, _ b : Int){
    print("Fun Types as parameter Types Result : \(mathFunction(a,b))")
}
printMathResult(anotherMathFunction, 5, 5)





//반환 형으로써의 함수 형(Function Types as Return Types)
//함수를 반환하는 함수도 가능함.
/*
func stepForward(_ input : Int) -> Int{
    print("stepForwrad input Value \(input)")
    return input + 1
}
func stepBackward(_ input : Int) -> Int{
    print("stepBackward input Value \(input)")
    return input - 1
}
//입력한 step에 하나를 더하거나 뺴는 함수 선언
//이 함수를 리턴값으로 사용 가능함.
func choosesStepFunction(_ backward: Bool) -> (Int) -> Int{
    print("check backwrod \(backward)")
    // 여기서 파라메터가 어떻게 들어가는지 모르겠음.
    //이해...
    return backward ? stepBackward : stepBackward
}

var currentValue = 3
let moveNearerToZero = choosesStepFunction(currentValue > 0)
//여기서 moveNearToZero fun변수의 파라메터는 chooseStepFunction의 리턴값임. 즉 (input : Int)....즉 int 값임.
 
 
//moveNearerToZero를 호출 할때마다 stepBackward 함수가 호출돼 입력값이 1씩 줄어 결국 0..
print("Counting to zero")

while currentValue != 0 {
    print("currentValue \(currentValue)")
    currentValue = moveNearerToZero(currentValue)
    //step 1 moveNearToZero 는 파라메터가 func임
    //input : INt...
    
    //step 2
}
print("zero");
*/



//중첩 함수 (Nested Functions)
/*
 함수 중에는 다른 함수 안의 body에서 동작하는 함수가 있다.
 이를 Nested function이라고 함.
 중첩 함수는 함수 밖에서는 감춰저 있고, 함수의  body 내에서 접근 가능함.
 위의 choseStepFunction을 중첩 함수를 이용하 다시 작성 가능함.
 */

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
//여기서 이미 함수는 결정되었고
//리턴 func도 결정 되었음.
//즉 bool이 결정...
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero는 이제 중첩 돼 있는 stepForward() 함수를 가르킵니다.
while currentValue != 0 {
    print("\(currentValue)... ")
    //retun functionPointer는 stepBackward를 가르키긴다...
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")







