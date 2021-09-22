import UIKit

/*if -else 구문...
 if 만 단독 사용가능, if 뒤에는 BOOL타입만 값만 위치해야함.
 */

//if-els사용
//ex)

let someInteger = 101

if someInteger < 100 {
    print("100 미만")
}
/*else if someInteger >100{
 print("100 초과")
 }else{
 print("100")
 }*/

/*
 조건에는 항상 Bool 타입이 들어와야함
 someInteger는 Bool 타입이 아는 Int타입이기때문에 컴파일 오류...남
 
 */

switch someInteger {
case 0:
    print("zero")
    break;
case 1..<100 : //1이상 100미만
    print("1 ~ 99")
    break;
case 100:
    print("100")
    break
case 100...Int.max:
    print("over 100")
default:
    print("unknown")
} //100


switch "sungjin" {
case "jake":
    print("jake")
    break;
case "mina":
    print("mina");
    break;
case "sungjin":
    print("sungjin")
    break;
default:
    print("unknown")
}

//암시적 진행을 사용하지 않음(NO Implicit Fallthrough)
/*
 C, Objecitvei-C switch 구문과 달리
 ex) default를 만날때까지 진행.그렇지않으면 break를 사용.
 
 
 Swift의 switch구문은 암시적 진행을 안함
 ex)break를 적지않아도 빠져나옴...
 break사용하여 빠져나올순 있음
 */

//case안에 최소 하나의 실행구문이 들어있어야함.
let anotherCharacter: Character = "a"
switch anotherCharacter {
//case "a": //Invaild, case문에 없기 때문에 에러 발생.
case "A":
    print("The letter A")
default:
    print("Not the letter")
}

//case안에 ,구분하여 복수 case조건 혼합(compound)해 사용가능
//Fallthrough를 사용하여 특정 지점가지 case문을 건너 뛸수있다.
let anotherChracter2 : Character = "a"
switch anotherChracter2 {
case "a","A":
    print("The letter A")
    fallthrough
case "b":
    print("check b")
    fallthrough
case "c":
    print("check c")
    fallthrough
case "d":
    print("check d")
    fallthrough
case "e":
    print("check e")
default:
    print("Not the letter A")
}

//인터벌 매칭(Interval Matching)
//숫자의 특정 범위를 조건으로 사용.
let approximateCount = 62
let counetedThing  = "moons orbiting Staurn"
let natualCount : String
switch approximateCount {
case 0:
    natualCount = "NO"
case 1..<5:
    natualCount = "a few"
case 5..<12:
    natualCount = "several"
case 12..<100:
    natualCount = "dozens of"
case 12..<100:
    natualCount = "hundreds of"
default:
    natualCount = "many"
}
print("There ar \(natualCount) \(counetedThing)")


//튜블(Tuple)
//튜플을 조건으로 사용가능
let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("0,0 \(somePoint)")
case (_,0):
    print("_,0 \(somePoint)")
case (0,_):
    print("0,_ \(somePoint)")
case (1,1):
    print("1,1 \(somePoint)")
    fallthrough
case (-2...0, -2...2):
    print("-2...0, -2...2 \(somePoint)")
default:
    print("defult \(somePoint)")
}

//값 바인딩 (Value Bindings)
/*
 특정 x,y값을 각각 다른 case에 정의하고, 그 정의된 상수를 또 다른
 case에서 사용가능함 이 기법을 갑 바인딩이라고함.
 */

let anotherPoint = (2,4)
switch anotherPoint {
case (let x, 0):
    //x값이 이리로 들어옴...
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an y value of \(y)")
case let(x,y):
    print("somewhere else at (\(x), \(y))")
}

//where문
let yetAnotehrPoint = (1,-1)
switch yetAnotehrPoint {
case let(x,y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let(x,y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let(x,y):
    print("(\(x), \(y)) is just some arbitrary point")
}


//혼합 케이스(Compound Cases)
/*
 case에 콤마 ','로 구분해 여러 조건을 혼합하여 사용
 */
let someCharacter : Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

//혼합 케이스에서도 바인딩 사용가능.
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}


//제어 전송 구문(Control Transfer Statement)
/*
 제어 전송구문은 코드의 진행을 계속 할지 말지 결정하거나,
 실해오디는 코드의 흐름을 바꾸기 위해 사용함
 Swift에서는 다음 다섯가자의 제어 전송 구문을 제공
 
 - countinue
 - break
 - fallthrough
 - return
 - throw
 
 */

// - continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]

for character in puzzleInput{
    if charactersToRemove.contains(character){
        continue
    }else{
        puzzleOutput.append(character)
    }
}
print("puzzleOutput \(puzzleOutput)")


// - Break
/*
 break 문은 전체 제어문으 실행응 즉각 중지.
 break 문은 loop 나 switch문에서 사용.
 */
let numberSymbol: Character = "三"  // 중국어로 3을 의미하는 문자입니다.
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}


//fallthrough문
/*
 fallthrough 키워드 이후는 case에 대해서도 실행하게 된다..
 Swift에서는 한번 특정 case를 타면 바로 그 switch 문은 종료.
 마치 case 안에 break를 자동으로 넣은 것과 같은 기능
 하지만 이 fallthrough 를 사용하면 이 자동으로 break가 사용되는 것을 막는음
 */

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
//!!!!fallthrough 는 case 조건을 확인하지 않고 그냥 다음 case를 실행
default:
    description += " an integer."
}
print(description)


// 레이블 구문(Labeled StateMents)
/*
 label name: while condition {
 statements
 }
 가장 인접한 문장이 아닌 원하는 문장을 제어하고 싶을 때 사용한다.
 */
outSide: for i in 1...3 {
    print("Outer Loop", i)
    
    for j in 1...3 {
        print("     inside", j)
        
        break outSide
    }
}

//이른 탈출 (Early Exit)
//guard문을 이용해 특정 조건을 만족하지 않으면 이 후 코드를 실행하지않고 방어코드 작성...
func greet(person: [String:String]){
    guard let name = person["name"] else{
        return
    }
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name":"Johe"])
greet(person: ["name":"Johe", "location1":"Cuperino"])


/*
 이용가능한 API 버전 확인(Checking API Availability)
 Swift에서는 기본으로 특정 플랫폼 (iOS, macOS, tvOS, watchOS)과 특정 버전을 확인하는 구문을 제공함
 */

if #available(iOS 10,macOS 10.12, *){
    print("available ios 10, mac os 10.12 ~")
}else{
    print("not support")
}

















