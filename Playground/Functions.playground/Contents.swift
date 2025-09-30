import UIKit

func myFunctions() {
    print("my Function")
}
myFunctions()


//Input && Output && Return

func sumFunction(x : Int, y : Int) -> Int {
    return x + y
    
}
let newSumFunction = sumFunction(x: 20, y: 30)
print(newSumFunction)


func logicFunction(a : Int , b : Int) -> Bool {

    if a > b
    {
        return true
    }
    else
    {
        return false
    }

}
logicFunction(a: 30, b: 25)

