//
//  main.swift
//  CurseOne
//
//  Created by Данил Олегович on 13.01.2022.
//

import Foundation

print("Hello, Teacher!")

protocol Farm {
     var animalcCount: Int { get set }
 }

 enum animalList {
     case cow
     case pig
     case hen
     case cock
     case horse
 }

 struct Animal: Farm {
     var animalcCount: Int
     var animalAmount: animalList
 }

 extension Animal: CustomStringConvertible {
     var description: String {
         return "There are \(animalcCount) of \(animalAmount) on the farm"
     }
 }

 struct AnimalTwo <T: Farm> {
     private var animals: [T] = []

     mutating func add(animal: T) {
         animals.append(animal)
     }

     mutating func removeFirst() {
         animals.removeFirst()
     }

     mutating func removeLast() {
         animals.removeLast()
     }

     mutating func removeElement(position: Int)  {
         if position < animals.count {
             animals.remove(at: position)
         } else { print("There's no \(position) position in this queue.") }
     }
 }

 extension AnimalTwo {
     func one (chosenCondition: (T) -> Bool) -> AnimalTwo<T> {
         var newAnimal = AnimalTwo<T>()
         for value in animals where chosenCondition(value) {
             newAnimal.add(animal: value)
         }
         return newAnimal
     }
 }
