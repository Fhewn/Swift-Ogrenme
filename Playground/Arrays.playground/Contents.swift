import UIKit

//Birden fazla değişkeni bir arada tutmaya yarar --Diziler
var myFavoriteMovies = ["Pulp Fiction","Friends","The Shawshank Redemption",5,true]as [Any]
myFavoriteMovies [2]
myFavoriteMovies [4]
myFavoriteMovies[0]
myFavoriteMovies[3]
//Any herhangi bir şey varsa
//as ----> casting

var myStringArrays = ["Fhewn","Fhewn1","Fhewn2","Fhewn3"]
myStringArrays[0].uppercased()
myStringArrays.count //İçerisinde Kaç tane eleman olduğunu gösterir
myStringArrays[myStringArrays.count - 1]
myStringArrays.last//sonuncuyu getir
myStringArrays.sort()//kendince dizilim yapar

var myNumberArrays = [1,2,3,4,5,6,7,8]
myNumberArrays.append(11)//yeni bir eleman ekleme
myNumberArrays.last
myNumberArrays[1] = 21
print(myNumberArrays)

//Set
//Dizi gibi fakat indexleme yok ve içinde sadece bir eleman bulundurur

//Unordered colection unique elements

var Set : Set = [1,2,3,4,5] // Sırasız koleksiyon
Set.first
var myStringSet : Set = ["a","b","c","a","b"]



var myInternetArray = [1,2,3,1,2,5,6,2,1]
//var myInternetSet = Set(myInternetArray)

var mySet1 : Set = [1,2,3]
var MySet2 : Set = [3,4,5]

var Myset3 = mySet1.union(MySet2) // union birleştirme
print(Myset3)



//Dictionary
//key-value pairing

var myFavoriteDirectors = ["Pul Fiction" : "Tarantino", "Inception" : "Christopher Nolan", "The Shawshank Redemption" : "Frank Darabont"]

myFavoriteDirectors["Pul Fiction"]

myFavoriteDirectors["Pul Fiction"] = "Quentin Tarantino"
myFavoriteDirectors["Seven Samurai"] = "Akira Kurisowa"
print(myFavoriteDirectors)

var myDictionary = ["Run" : 100, "Swim" : 200 ,"Basketball" : 300]
myDictionary["Swim"]

