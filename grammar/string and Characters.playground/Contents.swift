import UIKit

/* swift의 string 은 foundation 프레임워크
 NSString이 bridge된 타입.
 NSString메소드 String 에서 캐스팅 없이가능*/

//문자열은 큰 따옴표 ""묶어 표현
let something = "some string literval value";
print("quotation : \(something)")

//여러줄 문자열 리터럴
let quotation = """
The Whtie Babbit put on his spectacles. "Where shall I begin, please your Majesty?" he asked.
""";
print("quotation : \(quotation)")

let  softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \n
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \n
till you come to the end; then stop."
""";
print("softWrappedQuotation : \(softWrappedQuotation)")

//들여쓰기 모두 가능, 시작과 끝에각각 빈줄 넣고 싶으면 한줄 띄어서 문자열 입력.
let lineBreaks = """
This string starts with a line break.
It also ends with a line break.
"""
print("lineBreaks : \(lineBreaks)");

//문자열 리터럴의 특수 문자
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollaSign = "\u{24}"            // $, 유니코트 U+0024
let blackHeart = "\u{2665}"         // ♥, 유니코드 U+2665
let sparklingHeart = "\u{1F496}" // 💖,유니코드 U+1F496

//빈 문자열 초기화
var emtpryString = "";
var anotherEmptyString = String(); //객제생성..

//문자열 비엇는지 체크
if emtpryString.isEmpty{
    print("Nothing to see here");
}

//문자열 수정
var variableString  = "Horse";
variableString += "and carriage";
print("variableString : \(variableString)");

/*Swfit의 string은 값 타입(value type)이다.다른 함수 혹은 메스도로 부터 생성되면
 String값이 할당 될때, 이전 String의 레퍼런스를 할당 하는것이 아니라 값을 복사해서 생성한다.
 메소드에서 할당 받은 문자열은 그 문자열을 수정해도 원본 문자열이 변하지 않기 때문에 사용가능...*/
//for in loop 사용가능
for character in "Dog!🐶"{
    print(character);
}

//문자 상수 선언
let exclamationMark :Character = "!";

//문자 배열을 이용해 문자열의 초기화 메소드에 인자로 넣어 문자열 생성 가능.
let catCharacters : [Character] = ["C","a","t","!","🐱"];
let catString = String(catCharacters);
print("convert Characters array to String \(catString)");

//문자열 과 문자 결합
let string1 = "hello";
let string2 = "there";
var welcome = string1 + string2;

var instruction = "look over";
instruction += string2;

let exclamationMar : Character = "!";
welcome.append(exclamationMar);

let mutipier = 3;
let message = "\(mutipier) times 2.5 is \(Double(mutipier) * 2.5)";
print("\(message)");

//유니코드 전 세계의 모든 문자를 컴퓨터에서 일관되게 표현하고 다룰 수 있도록 설계된 국제 표준.
//swift 문자열과 문자타입은 유니코드에 순응(compliant)

let eAcute : Character = "\u{E9}";
let combinedEAcute : Character = "\u{65}\u{301}";

let precomposed : Character = "\u{D55C}"
let decomposed : Character = "\u{1112}\u{1161}\u{11AB}";

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
print("enclosedAcute \(enclosedEAcute)");

let regionalIndicatorForUS : Character = "\u{1F1FA}\u{1F1F8}";

//문자 세기
//문자열의 문자의 세기위해 count 프로퍼티를 이용한다.
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// "unusualMenagerie의 문자는 40개"


let greeting = "Guten Tag!";
greeting[greeting.startIndex];
// G
greeting[greeting.index(before: greeting.endIndex)];
// !
greeting[greeting.index(after: greeting.startIndex)];
// u

let index = greeting.index(greeting.startIndex, offsetBy: 7);
greeting[index];
//a

// greeting[greeting.endIndex];
// greeting.index(after: greeting.endIndex);

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
print();



//문자의 삽입과 삭제
//문자의 삽입과 삭제에는 insert(:at:), insert(contentOf:at:), remove(at:), removeSubrange(:)

//주의
//위 메소드들은 RangeReplaceableCollection 프로토콜을 따르는 Array, Dictionary, Set 등에서도 동일하게사용

var welCome = "hello";
welCome.insert("!", at: welCome.endIndex);
//Character만 가능 welcome : hello!

welCome.insert(contentsOf: "there", at: welCome.index(before: welCome.endIndex));
//welcome 마지막 인덱스 전에 there를 넣어라?... ex) hellothere!
let _index = welCome.index(welCome.startIndex, offsetBy: 5);
welcome.remove(at: welcome.index(before: welcome.endIndex))

let range = welCome.index(welCome.endIndex, offsetBy: -6)..<welCome.endIndex;
//-1,-2로 접근하면 index 에서 뒤로 가라는 말...
//range는 타입이 Range Class이고 String.index ... Int 아님 변수이다
welCome.removeSubrange(range);








//부분 문자열
//문자열에서 부분문자열을 얻기 위해 prefix(_:) 와 같은 서브 스크립트 메소드를 이용 할 수 있는데
//그렇게 얻은 부분 문자열은 문자열(String) 인스턴스가 아니라 부분문자열(SubString)인스턴스....
//문자열 인스턴스로 바꿔서 사용 하는 것이 좋음.
let greeting2 :String = "Hello, World";
let index2 = greeting2.firstIndex(of:",") ?? greeting2.endIndex;
//let index3 = greeting2.firstIndex(of: "e") ?? greeting2.endIndex;
let beginning = greeting2[..<index2];
// begining : hello

//subString인 beginning을  String으로 변환
//subString은 해당 문자를 직접 갖고 있는 것이 아니라 원본 String의 메모리를 참조해 사용.
let newString = String(beginning);





//문자열과 문자비교
let quotation2 = "We're a lot alike, you and I."
let sameQuotation = "We're a lost alike, you and I."
if quotation2 == sameQuotation {
    print("These two strings are considered equal")
}else{
    print("quotation2 sameQoutation is not equals")
}

// 유니코드는 결합된 문자열을 갖고 비교한다.
// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}


// 같은 유니코드 문자여도 유니코드가 다르면 다른 문자로 판별
// These two strings are considered equal 출력
let latinCapitalLetterA: Character = "\u{41}" //영어
let cyrillicCapitalLetterA: Character = "\u{0410}" //러시아어
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.")
}
// Prints "These two characters are not equivalent."







//접두사 접미사 비교
// 접두사 접미사 비교를 위해 hasPrefix(:), hasSuffix(:) 메소드를 사용 할 수 있다.
let remeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var actiSceneCount = 0;
for scene in remeoAndJuliet{
    if (scene.hasPrefix("Act 1")){
        actiSceneCount += 1;
    }
}
print("There are \(actiSceneCount) scenes in Act 1");

//접미어 Capulet's mansion 과 Friar Lawrences' cell 이 각각 몇개 들어 있는지 확인
//string[]만 가능...한걸로...ㅎㅎ
var mansionCount = 0;
var cellCount = 0;
for scene in remeoAndJuliet{
    if(scene.hasSuffix("Capulet's mansion")){
        mansionCount += 1;
    }else if(scene.hasSuffix("Friar Lawrence's cell")){
        cellCount += 1;
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scense");





///문자열 유니코드 표현
//유니코드 문자가 텍스트 파일이나 다른 저장소에 쓰여질 때 유니코드 스칼라는 UTF-8, UTF-16, UTF-32등 다양한
//유니코드 인코딩 방식이 사용..
let dogString:String = "Dog!!🐶";
for codeUnit in dogString.utf8{
    print(codeUnit,"",terminator: "")
}





































