# Swift Basics 2

We're going to learn about:
- [x]  Closures
- [x] Optionals
- [x] Swift's Named Parameters
- [x] TypeCast

## Closures
Functions inside other functions
###### TIP: Always, use self. inside a closure to refer to what is outside

```Swift
func calculator (n1: Int, n2:Int, operation:(Int,Int) -> Int) -> Int{
    return operation(n1,n2)
}

let result = calculator(n1: 2, n2: 3){$0*$1}
```
### Filter, Map, Reduce
```Swift
let array = [6,2,3,9,4,1]
```
#### Filter
Filtrate something and generate another Array as Output
```Swift
let arrayEvenNumbers = array.filter{$0 % 2 == 0} 
```
###### Response
```
[6, 2, 4]
```
Got the even numbers from the main array
#### Map
Change it all and generate another Array as Output
```Swift
let arrayPlusOne = array.map{$0+1}
```
###### Response
```
[7, 3, 4, 10, 5, 2]
```
#### Reduce
Reduce it and generate a singular result 
```Swift
let arraySum = array.reduce(0){$0 + $1}
```
Begins from 0 and add each element of the Array
###### Response
```
25
```
#### Flat Map
Map + (Flat the collection)

```Swift
let arrays = [array,array]
let DoubledArray = arrays.flatMap{$0.map{$0}}
```
###### Response
```
[6, 2, 3, 9, 4, 1, 6, 2, 3, 9, 4, 1]
```

## Optionals
It can be return Nil

### SearchString Function
We can see that the returned value can be Nil if there's no "C" in "S". So, it's putted the "?" to mean the sentence "is Nil?"
```Swift
func Search(ifContains c:Character, in s:String) -> String.Index?{
    return s.lastIndex(of: c)
}
```
Besides that, we use external and interval paramaters to leave the function more readable: "Search ifContains C in S"
### How to work with Optionals?
```Swift
Search(ifContains: "á", in: "Olá")?.encodedOffset 
```
the output of this code will remain a ``` Optional() ```, until you UNWRAP

### Unwrapping Optionals

#### Unsafe Method
This is not highly recommended, as it is going to crash the app if the value is "Nil". 
```Swift
Search(ifContains: "á", in: "Olá")!.encodedOffset
```
But, you can use it if you're sure about the value

#### Safe Method
This is more recommended

```Swift
if let s = Search(ifContains: "á", in: "Olá"){ //safe unwrapping the optional
    print("let ",s.encodedOffset)
}
```
#### The Nil Coalescing Operator
When the value is Nil, it will replace it with ```-1```
```Swift
Search(ifContains: "á", in: "Olá")?.encodedOffset ?? -1
```

## TypeCast
Change the variables Type!

###### Super Class:
```Swift
class Animal{
    var name:String
    
    init(n: String){
        self.name = n
    }
}
```
###### Classes that inherited the Animal class:
```Swift

class Human:Animal{
    func code(){
        print("Typing away...")
    }
}

class Fish:Animal{
    func breatheUnderWater(){
        print("Glup Glup!")
    }
}

```
###### Instances:

```Swift

let joao = Human(n: "João Victor Ipirajá")
let jack = Human(n: "Jack Bauer")
let darwin = Fish(n: "Darwin Watterson")

let neighbours:[Animal] = [joao,jack,darwin]
```
### Categories:

#### Downcast

##### Unsafe
```Swift
func findDarwin(from animals: [Animal]){
    
    for animal in animals{
        if(animal is Fish){ //check the type
            print(animal.name)
```
###### How it checks before doing the downcast, it has no chance of giving an error ☝🏼
```Swift
            let fish = animal as! Fish
 ```
 ```Swift           
            fish.breatheUnderWater()
        }
    }
}
```
##### Safe

```Swift
func findNemo(from animals: [Animal]){
    for animal in animals{
 ```  
 ```Swift  
        if let fish = animal as? Fish{
  ```
  ```Swift
            print(fish.name)
            fish.breatheUnderWater()
        }
        
    }
}
```
#### Upcast
```Swift  

func findNemo(from animals: [Animal]){
    
    for animal in animals{
        if(animal is Fish){ //check the type
            print(animal.name)
            let fish = animal as! Fish // force downcast
            fish.breatheUnderWater()
```
###### Raise an object to super class type

```Swift 
            let animalFish = fish as Animal 

        }
    }
}
```
### Any, AnyObject,NSObject:
#### Any
You can put anything in the Array
```Swift
let num = 1
let neighbours:[Any] = [joao,jack,darwin,num]
```
#### AnyObject
You can put Any Class in the Array

```Swift

class Human{
    func code(){
        print("Typing away...")
    }
}

class Fish{
    func breatheUnderWater(){
        print("Glup Glup!")
    }
}
let neighbours:[AnyObject] = [joao,jack,darwin]
```
#### NSObject
You can put Any Foundation Data Type in the Array






