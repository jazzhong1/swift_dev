//제어문 (Control Flow)
//Swift에서는 While loop, if guard, switch, for-in문 등 많은 제어문을 제공한다.

//For-In 문 (For-In Loops)
//for-in 문은 배열, 숫자, 문자열을 순서대로 순회(iterate)하기 위해 사용한다.
let names = ["Anna", "Alex", "Brain", "Jack"];
for name in names{
    print("\(name)");
}

//dictionary에서 반환된 키(key)-값(value) 쌍으로 구성된 튜플을 순회하며 제어 할 수도 있다.
let numberOfLegs = ["spider":8, "ant":6, "cat":4];
for(animalName, legCount) in numberOfLegs{
    print("\(animalName)s have \(legCount) legs");
}

for index in 1...5{
    print("\(index) times 5 is \(index * 5)");
}

//for-in 문을 순서대로 제어 할 필요가 없다면, 변수자리에 _ 키워드를 사용하면 성능을 높일 수 있다.
let base = 3;
let power = 10;
var answer = 1;
for _ in 1...power{
    print("base  = \(base) , answer = \(answer)");
    answer *= base;
}
print("\(base) to ther power is \(answer)");

//범위 연산자와 함께 사용 할 수 있다.
let minutes = 60;
for tickMark in 0..<minutes{
    //print("tickMark \(tickMark+1)");
}

//strid(frm:tp:by:) 함수와 함께 상용가능... 구간 5로 설정한 경우
//구간 5를 띄어가며 실행한다.
//let minuteInterval = 5;
//to: 뒤의 경계를 포함 하지 않는다.
for tickMark in stride(from: 0, to: 12, by: 1){
    print("check tickMar \(tickMark)");
    //render the tick mark every 5 minute (0, 5, 10 ,15 .. 55)
}

//stride 구간 3으로 설정 한 경우
//throung ClosedRange 처럼 뒤쪽 경계값을 포함.
let hours = 12;
let hourInterval = 3;
for tickMark in stride(from: 0, through: hours, by: 1){
    print("tickmark \(tickMark)");
}

//While문
//Swift에서 While과 repeat-While 두가지 종루... do-while인듯...
//condition이  false일 때까지 구문(statements)를 반복 한다.
var square = 0;
var dicRoll = 0;
let finalSquare = 20;
while square < finalSquare {
    print("check square \(square)");
    square+=1;
}

//repeat do while..로 쓰기도함........?
square = 0;
repeat{
    print("repeat while \(square)");
    square += 2;
}while square < finalSquare


