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





