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
    print("tickMark \(tickMark+1)");
}

