import UIKit

var myName : String?
myName?.uppercased()
//myName?.uppercased()    ? koyarsak belki isim veririm belki isim vermem
// nil boş demek

//myName!.uppercased()    ! koyarak %100 eminim bu değer var olacak


//optionals : ? vs !

var myAge = "S"
var myInteger = (Int(myAge) ?? 0) * 5

if let  myNumber = Int(myAge) {
    print(myNumber * 5)
}
else
{
    print("Not a number")
}
