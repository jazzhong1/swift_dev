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
//someInts.removeAll()
someInts = []; //배월을 비움...type 은 Int 유지

//기본 값으로 빈 배열 생성
//repeating 메소드, count 메소드를 이용해 기본 값으로 빈 배열을 생성 할 수 있다.
//repeation 반복...다 채움.
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
print("check shopping \(shoppingList)")
shoppingList[4...6] = ["Bananas", "Apples"];
//4, 5, 6번쨰 인덱스 아이템을 Bananas, Apples로 변환.
//4 = Bananas
//5 = remove.
//6 = Apples
//즉 아이템 3개 -> 2 개로 줄어듬.
print(shoppingList);

//특정 위치에 원소 추가/삭제/접근
shoppingList.insert("Maple Syrp", at: 0);
let mapleSyrup = shoppingList.remove(at: 0);
//return mapleSyrup...POP?
print(mapleSyrup);
firstItem = shoppingList[0];
//firstItem = "Six eggs";

let apples = shoppingList.removeLast();

for item in shoppingList {
    print(item);
}

//배열 인덱스가 필요할때 enumerated()메소드.
//카운트 변수 안써도가능..
for (index,value) in shoppingList.enumerated() {
    print("Item \(index + 1) : \(value)");
}



//Set
//1. 요소의 저장 순서를 유지하지 않습니다.
//2. 같은 요소의 중복 저장을 허용하지 않습니다.
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
//동등맴버 여부확인?

houseAnimals.isSubset(of: farmAnimals); //housAnimls 이 farmAnimal의 요소가 속하냐
farmAnimals.isSuperset(of: houseAnimals); //farmAnimal 이 housAnimls를 가지고있냐

farmAnimals.isSubset(of: houseAnimals)
houseAnimals.isSuperset(of: farmAnimals)

farmAnimals.isDisjoint(with: cityAnimals);//안겹치냐?

var nameOfIntegers = [Int:String](); // dictionary생성 Int = key, Stirngvalue...
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
airport["check123"] = "123123";
print("checkAirPort \(airport)")



/*
 컬렉션 타입
 Array - 순서가 있는 리스트 컬렉션,
 Dictionary - 키와 값의 쌍으로 이루어진 컬렉션,
 Set - 순서가 없고, 멤버가 유일한 컬렉션
 */

var integers:Array<Int> = Array<Int>()
integers.append(1) //추가
integers.append(100)
integers.append(300)

integers.contains(100) //있는지 없는지 확인
integers.contains(500);

print("check integers count \(integers.count)")
integers[0] //인덱스 확인
integers[0] .isMultiple(of: 100)
integers.remove(at: 0); //특정 인덱스 제거
print(integers)
print(integers.removeLast())
print(integers.removeAll())
print("check integers count \(integers.count)")


/*
 Array<Double>와 [Double]는 는 동일 한 표현
 빈 Double Array 생성 등등...다른 타입도 가능
 */
var doubles: Array<Double> = [Double]()
doubles = [Double]() //이런식으로 생성 가능

var strings: [String] = [String]()
strings = [String]()

//빈 Character Array 생성
//[]튼 빈 Arrray
var characters: [Character] = []
characters = [Character]();

let immutableArray = [1,2,3] //불편 Arrray


//MARK: - Dictionary
//컬렉션 타입으로 Dictionary 생성
var anyDictionary: Dictionary<String,Any> = [String: Any]()
anyDictionary = [String:Any]();

anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"]  = 100;

dump(anyDictionary)
print(type(of: anyDictionary))
print(anyDictionary)

anyDictionary.removeValue(forKey: "someKey")
anyDictionary["someKey"] = nil
print(anyDictionary)

let emptyDictionary: [String: String] = [:] //빈 dict
let initiazlieDictionary  = ["name":"sungint","gender":"male"]
dump(initiazlieDictionary)

//let someValue: String = initiazlieDictionary["qefqf"]

//MARK: - Set

//주로 집합...개념으로 많이 씀..? 순서가 없음 멤버가 유일한 것을 보장하는 컬렉션 타입
var integerSet = Set<Int>()
integerSet.insert(100)
integerSet.insert(100)
integerSet.insert(100)
integerSet.insert(1)
integerSet.insert(2)
integerSet.insert(43)

print("check integerSet Value 45 \(integerSet.contains(45))")
print("check integerSet Value 43 \(integerSet.contains(43))")
print("check integerSet count \(integerSet.count)")
print("check integerSet \(dump(integerSet))")

let setA: Set<Int> = [1,2,3,4,5]
let setB: Set<Int> = [4,5,6,9,2]

let union: Set<Int> = setA.union(setB); //합집합
print("check union \(union)")

let sortedUnion: [Int] = union.sorted() //정렬
print("check sortedUinion \(sortedUnion)")

let intersection: Set<Int> = setA.intersection(setB)// 교집합
print("check intersection \(intersection)")

let subtraction: Set<Int> = setA.subtracting(setB) //차집합
print("check subtraction \(subtraction)");





