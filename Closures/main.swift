//
//  main.swift
//  Closures
//
//  Created by João Victor Ipirajá de Alencar on 29/12/20.
//



func calculator (n1: Int, n2:Int, operation:(Int,Int) -> Int) -> Int{
    return operation(n1,n2)
}
let result = calculator(n1: 2, n2: 3){$0*$1}

print(result)

let array = [6,2,3,9,4,1]

let arrayPlusOne = array.map{$0+1}
let arrayToString = array.map{"\($0)"}
