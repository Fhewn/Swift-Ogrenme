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
