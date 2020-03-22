/*
Swift에서는 콜렉션 타입으로 Array , set , Dictionary 세가지를 지원.
var 로 타입을 할당 하면 변경 가능하고, let에 할당하면 변경 불가능.
*/

/*
 Array
 배열의 축약형 문법
 Array로 적을 수 있고, 축약형으로 [Element] 형태로 사용 할 수도 있다.
 */
//빈 배열 생성
var someInts = [Int]();
print("someInts is of type [Int]with \(someInts.count) items");
someInts.append(3); //추가
someInts.append(5); //추가
someInts = []; //배월을 비움...type 은 Int 유지

//기본 값으로 빈 배열 생성
//repeating 메소드, count 메소드를 이용해 기본 값으로 빈 배열을 생성 할 수 있다.
var threeDoubles = Array(repeating: 0.0, count:3);
// threeDoubles : Double 타입의 [0.0, 0.0, 0.0]

//다른 배열을 추가한 배열의 생성
// + 연산자를 이용해 배열을 합칠 수 있다.
var anotherThreeDoubles = Array(repeating: 2.5, count: 3);
var sixDoubles = threeDoubles + anotherThreeDoubles;

//리터럴을 이용한 배열의 생성
var shoppingList: [String] = ["Eggs","Milk"];
//간단하게
shoppingList = [];
shoppingList = ["Eggs","Milk","bread"];

//배열의 접근 및 변환
//배열의 원소 개수 확인
print("The shopping list contains \(shoppingList.count) items.")

//배열에 원소 추가
shoppingList.append("Four");
shoppingList.count;

shoppingList += ["Baking Powder"];
shoppingList += ["Chocolate Spread", "Cheese", "Butter"];

//배열 특정 위치의 원소 접근
var firstItem  = shoppingList[0];

shoppingList[4...6] = ["Bananas", "Apples"];
print(shoppingList);

//특정 위치에 원소 추가/삭제/접근
shoppingList.insert("Maple Syrp", at: 0);
let mapleSyrup = shoppingList.remove(at: 0);
print(mapleSyrup);
firstItem = shoppingList[0];
//firstItem = "Six eggs";

let apples = shoppingList.removeLast();

for item in shoppingList {
    print(item);
}

//배열 인덱스가 필요할때 enumerated()메소드.
for (index,value) in shoppingList.enumerated() {
    print("Item \(index + 1) : \(value)");
}



//Set
//set 형태로 저장되기 위해서는 반드시 타입이 hashable  이여야 한다
//Swift에서 String, Int, Double, Bool 같은 기본타입은 기본적으로 hashable이다.
//Set 타입은 Set으로 선언한다...
var letter = Set<Character>();
print("letter is of type Set<Character> with \(letter.count) item");
letter.insert("a");
letter = [];

//배열 리터럴을 이용한 Set생성
var favoriteGenres : Set<String> = ["Rock", "Classical", "Hip hop"];

//Swift의 타입추론으로 아래와 같이 선언 가능..
var _favoriteGenres: Set = ["AAA","BBB","CCC"];
print("I have \(favoriteGenres.count)")

if favoriteGenres.isEmpty{
    print("As far as music goes, I'm not picky.");
}else{
    print("I have particual music preferences");
}
favoriteGenres.insert("Jazz");
print("favoriteGenres \(favoriteGenres)")

if let removedGenre = favoriteGenres.remove("Rock"){
    print("\(removedGenre)? I'm over it");
}else{
    print("I never much cared for that");
}

if favoriteGenres.contains("Funk"){
    print("I get up on the good foot");
}else{
    print("I never much cared that");
}

//Set순회
//for-in loop를 이용해 set을 순회 할 수 있다.
for genre in favoriteGenres{
    print("\(genre)");
}

//Set명령
let oddDigits: Set = [1,3,5,7,9];
let evenDigits: Set = [0,2,4,6,8];
let singleDigitPrimeNumber: Set = [2,3,5,7];

oddDigits.union(evenDigits).sorted(); //합집합...
oddDigits.intersection(evenDigits).sorted() //교집합..
oddDigits.symmetricDifference(evenDigits).sorted(); //겹치지 않는애들
oddDigits.subtracting(singleDigitPrimeNumber).sorted(); //oddDigits만 해당..


let houseAnimals: Set = ["🐶", "🐱"];
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"];
let cityAnimals: Set = ["🐦", "🐭"];
houseAnimals.isSubset(of: farmAnimals);
farmAnimals.isSuperset(of: houseAnimals);
farmAnimals.isDisjoint(with: cityAnimals);//안겹치냐?

var nameOfIntegers = [Int:String](); // dictionary생성
nameOfIntegers[16]="sixteen";
nameOfIntegers = [:];

//리터럴을 이용한 Dictionary의 생성
var airport : [String:String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"];
print("The airports dictionary contains \(airport.count) items");

//빈 Dictionary확인
if airport.isEmpty{
    print("is empty");
}else{
    print("is not empty");
}

airport["LIB"] = "London";














