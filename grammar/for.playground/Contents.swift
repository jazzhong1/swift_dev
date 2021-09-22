import UIKit

/*
 기존언어의 for-each 구문과 유사 Dictionary 경우 이터레이션이 자동으로..동작
 ㄷ ㄷ ㄷ ㄷ ㄷ
 ex)
 for item in items{
 
 }
 */
var integers  = [1,2,3]
let people = ["sungin" : 10, "eric": 15, "mike": 12]

for ii in integers{
    print(ii)
}
//Dictionary의 item은 key , value 로 구성된 튜플..
for(name , age) in people{
    print("name is \(name) and age is \(age)")
}

/*while구문 똑같음..
 while 조건{
    실행구문
 }
 */

/*while integers.count>0 {
    print(integers)
    integers.removeLast()
}*/

//repeat-while 구문
//기존 언어의 do-while구문과 형태 및 동작이 유사..

/*(repeat{
    //실행구문
}while 조건
*/
repeat{
    integers.removeLast()
}while integers.count>0

