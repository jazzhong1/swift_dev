import UIKit

//Assignment Operators 할당 연산자
let b = 10; //선언 시 처음 입력된 데이터만 저장.
var a = 5; //선언시 처음 입력된 데이터 이후 추가 입력가능
a = b;
//print(a);

let (x,y) = (1,2);
//print(x,y);

//Arithmetic Operators 사칙 연산자
1 + 2;
5 - 3;
2 * 3;
10.0 / 2.5;

"hello, " + "world";

//Remainder Operator
9 % 3
-9 % 4

//Unary Minus Operator
//숫자 값은 - 로 표현되는 단항 음수 연산자에 의해 부호가 변함
let three = 3;
let minusThree = -three;
let plusThree = -minusThree;

//Unary Plus Operator
//+로 표현되는 단항 양수 연산자는 부호에 아무련 영향 X
let minusSix = -6;
let alsoMinusSix = +minusThree;

//Compund Assignment Operators
var c = 1
c += 32

//Comparieson Operators

let name = "world";
if name == "world"{
    print("equals world");
}else{
    print(name+"is not equals");
}
(1, "zebra") < (2, "apple");
(3, "apple") < (3, "bird");
(4, "dog") == (4, "dog");

("blue", -1) < ("purple", 1);
//("blue", false) < ("purple",true); Boolean 비교 할 수 없음

//Ternary Conditional Operator
let contentHeight = 40;
let hasHeader = true;
var rowHeight = contentHeight + (hasHeader ? 50 :20);

if (hasHeader){
    rowHeight = contentHeight + 50;
}else{
    rowHeight = contentHeight + 20;
}

//Nil-Coalescing Operator Nil 병합연산자
let defaultColorName = "red";
var userDefinedColorName : String? //초기화? 도 되나?ㅋㅋㅋ
userDefinedColorName;
userDefinedColorName = "green";
var colorNameToUse = userDefinedColorName ?? defaultColorName;
// userDefinedColorName nil이 아니므로 colorNameToUse 는 "Green" 결국 삼항..연산 복합..

//Range Operators 범위연산자
//닫힌 범위 연산자(Closed Range Operator
//(a..b) 형태로 범위의 시작과 끝이 있는 연산자.. for-In loop에 자주 사용된다.
for index in 1...5{
    print("\(index) times 5 is \(index * 5)");
}

//Half-Open Range Operator 반 닫힌 범위 연산자
/*(a...<b) 형태로 a 부터 b 보다 작을 때 까지의 범위를 갖는다.
 즉, a부터 b-1까지 값을 갖는다. ...배열이 배열크기의 -1까지 같기 때문에..
 */
let names = ["Anna", "Alex","Brain","Jack"];
let count = names.count;

for i in 0..<count{
    print("Person \(i + 1 ) name is \(names[i])");
}

//One-Side Ranges 단 방향 범위
/*
 [a..] [..a] 의 형태로 범위의 시작 혹은 끝만 지정해 사용하는 범위 연산자
 */
for name in names[2...]{ //index 2 부터...
    print("One-Side Ranmge ex)[2...] = \(name)");
}
print("\n");
for name in names[...2]{
    print("One-Side Ranmge ex)[...2] = \(name)");
}
print("\n");
//Half-Open Range는 값 범위에 포함 되지 않는다.
for name in names[..<2]{ //0<2
    print("Half-open Range ex)[..<2] = \(name)");
}

//단방향 범위 연산 subscript뿐만 아니라 아래와 같이 특정 값을 포함하는지 여부를 확인 할 때도 사용 가능함.
let range = ...5; //-몇부터지?
range.contains(7); //false
range.contains(6); //false
range.contains(4); //true
range.contains(-1); //true

//논리 연산자(Logical Operators)
/*
  swift에서는 총 세가지 논리 연산자를 지원.
  논리 부정 NOT (!a)
  논리 곱 AND (a && b)
  논리 합 OR (a || b)
 */
//논리 부정 연산자(Logical NOT Operator)
let allowedEntry = false;
if !allowedEntry{
    print("ACCESS DENIED");
}
// Prints "ACCESS DENIED"

//논리 곱 연산자(Logical AND Operator)
let enterDoorCode = true;
let passedRetinaScan = false;
if enterDoorCode && passedRetinaScan{
    print("Welcome!");
}else{
    print("ACCESS DENIED");
}

//논리 합(OR) 연산자(Logical OR Operator)
let hasDoorKey = false;
let knowsOverridePassword = true;
if hasDoorKey || knowsOverridePassword {
    print("Welcome!");
}else{
    print("ACCESS DENIED");
}

//논리 연산자의 조합(Combining Logical Operators)
//두 개 이상의 논리 연산자를 조합해서 사용 할 수 있다
if enterDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword{
    print("Welcome!");
}else{
    print("ACCESS DENIED");
}

//명시적 괄호(Explicit Parentheses)
//논리 연산자의 적용 우선 순위를 연산자에 맡지기 않고 명시적으로 괄호를 사용해 계산 순서를 지정할 수 있습니다.
/*if(enterDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword{
    
}*/




