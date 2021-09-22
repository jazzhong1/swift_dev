import Foundation
/*
 Enumerations
 열거형은 관련된 값으로 이루어진 그룹을 공통의 형으로(type)선언해
 안전성(type-safety)를 보장하는 방법으로 코드를 다룰 수 있게 해준다.
 C, Objc-c 가 Interger값들로 열거형을 구성했으나..
 
 Swift에서는 case 값이 string, character, integer, floting..값들
 을 사용 할 수 있다.
 열거형은 1급 클래스형(first- class type)이여서 계산된 프로퍼티(computed properties)를 제공하거나,
 초기화를 지정하거나, 초기 선언을 확장해 사용 할 수있다.
 
 */

/*
 열거형 문법(Enumeration Syntax)
 enum 키워드를 사용해 열거 형을 정의
 */

enum SomeEnumeration{
    //enumeration definition gose here
}

//네가지 방향을 갖는 compassPointer 열거형 선언
enum CompassPoint{
    case north
    case south
    case east
    case west
}
//swift는 열거형의 각 case는 Comppastpoint으로 온전한 값 이다.
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
print("check directionToHead \(directionToHead)")
//directionToHead의 형은 초기화 될떄 타입 추론으로 CompassPoint
//CompasPoint 로 한번 정의되면 다음에 값을 할당할ㄹ떄 형을 생략한 점,
/// dot syntax를 이용해 값을 할당 하는 축약형 문법을 사용할 수 있따.

directionToHead = .west
/*
 Swift 구문에서 열거형 값 매칭하기
 (Matching Enumeration Value with a Switch Statement)
 */
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}


enum Barcode{
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

//BarCode선언
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFHHIJKLM")

//switch case문 사용할떄 상수. 변수로 선언간으
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

/*
 Raw 값 (Raw Values)
 C, Objc-c 같이 case에 raw값을 지정 할 수 있다.
 */
/* Character형의 raw로 정의 했지만, String, cahracter, Interger, Float등의 형을 사용 할 수도 있다. 유일한 값으로 중복해서는 안된다.
 Raw값은 관계 값(accociated value)과는 다르다.
 Raw값은 처음 선언할 떄 정의되서 특정 열거형의 raw값은 항상 같은 값을 같는다.
 관계같은 case라도 생성될떄 달라 질 수있다.
 */
enum ASCIIControlCharacter : Character{
    case tab = "\t"
    case lineFeed = "\n"
    case carrigeReturn = "\r"
}

/*
 암시적으로 할당된 Raw값 (Implicitly Assigned Raw Values)
 raw값으로 Integer, String값을 사용할수 있다
 case 별로 명시적으로 raw값을 할당 할 필요는 없다.
 raw값을 할당 하지 않으면 swift에서 자동으로 할당해준다.
 */



enum Planets: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    //자동 할당.
}
print("check Planet \(Planets.earth)")

enum CompassPoints: String {
    case north, south, east, west
    //자동 할당. String....
}
print("check CompassPoints \(CompassPoint.east)")
print("check CompassPoints rawValue \(CompassPoints.west.rawValue)")
/*
 Raw 값을 이용한 초기화(Initialize from Raw Value)
 raw 값을 이용해 열거형 변수를 초기화 할 수 있다.
 raw 갑슬 갖는 7을 열거형 변수 초기값으로 지정.
 */
let possiblePlanet = Planets(rawValue: 21)
//raw 값 초기자는 모든 raw값에 대해 열거형 case를 반환이 보장되지 않으므로
//실패 할 수 있는 초기자(failable initializer)...


let positionToFind = 11
if let somePlanet = Planets(rawValue: positionToFind){
    switch somePlanet{
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}


/*
 재귀 열거자 (Recursie Enumerations)
 재기귀 열거자는 다른 인스턴스를 관계 값으로 갖는 열거형 입니다.
 재귀 열거자 case앞에 indriect키워드를 붙혀 사용함.
 얘를 왜쓰지?
 */

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
//만약 관계를 갖는 모든 열거형 case에 indrect를 표시하고 싶으면
//enum 키워드 앞에 indrect표시를 하면 된다.
/*
 
 indirect enum ArithmeticExpression {
 case number(Int)
 case addition(ArithmeticExpression, ArithmeticExpression)
 case multiplication(ArithmeticExpression, ArithmeticExpression)
 }
 */

//(5 + 4) * 2를 재귀 얼거자로 표현한것
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum , ArithmeticExpression.number(2))
func evluate(_ expression: ArithmeticExpression) -> Int{
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evluate(left) + evluate(right)
    case let .multiplication(left, right):
        print("type is multiplication")
        return evluate(left) * evluate(right)
    }
}
print(evluate(product))







