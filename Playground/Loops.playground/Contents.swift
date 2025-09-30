import UIKit

var myNumber = 7
myNumber = myNumber + 1
myNumber += 1
myNumber



var number = 0

//while Loop

while number <= 10 {
    print(number)
    number += 2
}


var characterAlive  = true

while characterAlive == true{
    print("Karakter Yaşıyor")
    characterAlive = false
}

3 < 5  //küçüktür
5 <= 3 //küçük eşittir
5 > 3 //büyüktür
5 == 5 //eşit
4 != 5 //eşit değildir



// For Loop
//bunu daha çok dizi ile kullanılır

var myFruitArray = ["Elma","Şeftali","Kiraz","Portakal"]

for fruit in myFruitArray{
    print(fruit)
}

 
var Number = [10,20,30,40,50]

for num in Number {
    print(num / 5)
}


for newNumberIntger in 1...5 {
    print(newNumberIntger * 5)
}
