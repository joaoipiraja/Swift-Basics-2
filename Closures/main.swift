//
//  main.swift
//  Closures
//
//  Created by João Victor Ipirajá de Alencar on 29/12/20.
//


import Foundation


//MARK: - Closures

func calculator (n1: Int, n2:Int, operation:(Int,Int) -> Int) -> Int{
    return operation(n1,n2)
}
let result = calculator(n1: 2, n2: 3){$0*$1}

print(result)

let array = [6,2,3,9,4,1]

let arrayPlusOne = array.map{$0+1}
let arrayToString = array.map{"\($0)"}

//MARK: - Optionals and func nameOfFunction(external internal)


func searchString(in s:String, ifContains c:String) -> Bool?{
    return s.contains(c)
}

print(searchString(in: "Olá", ifContains: "á")!) //Unsafe unwrapping the optional

if let s = searchString(in: "Olá", ifContains: "á"){ //safe unwrapping the optional
    print(s)
}

if searchString(in: "Olá", ifContains: "á") ?? false{
    print("Cotains")
}



//MARK: - TypeCast

class Animal{
    var name:String
    
    init(n: String){
        self.name = n
    }
}

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

let joao = Human(n: "João Victor Ipirajá")
let jack = Human(n: "Jack Bauer")
let darwin = Fish(n: "Darwin Watterson")

let num = 12
let neighbours:[AnyObject] = [joao,jack,darwin]
//AnyObject - Only for classes
//NSObject - Only for classes create from Apple (that starts with "NS")





if neighbours[0] is Human{
    print("Fist Neighbour is a Human")
}

func findNemo(from animals: [Animal]){
    
    for animal in animals{
        if(animal is Fish){ //check the type
            print(animal.name)
            let fish = animal as! Fish // force downcast
            fish.breatheUnderWater()
            let animalFish = fish as Animal //Upcast: Raise an object to super class type
        }
    }
}


func findNemo2(from animals: [AnyObject]){
    for animal in animals{
        if let fish = animal as? Fish{ //Safe way to perform downcast
            print(fish.name)
            fish.breatheUnderWater()
        }
        
    }
}



//findNemo(from: neighbours)
findNemo2(from: neighbours)

//Any, AnyObject,NSObject
