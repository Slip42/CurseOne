//
//  main.swift
//  CurseOne
//
//  Created by Данил Олегович on 13.01.2022.
//

import Foundation

print("Hello, London!")

// MARK: Кофемашина (1 метод)

enum coffeeError: Error {
    case countError
    case nameError
    case priseError
}

struct Item {
    let drinks: Drinks
    let price: UInt
    let countOfSugar: UInt
    var count: UInt
}

struct Drinks {
    let name: String
    let milk: Bool
}

class CoffeeMachine {
    var list = ["Americano": Item(drinks: Drinks(name: "Americano", milk: true), price: 30, countOfSugar: 1, count: 10),
                "Latte": Item(drinks: Drinks(name: "Latte", milk: true), price: 50, countOfSugar: 3, count: 10),
                "Espresso": Item(drinks: Drinks(name: "Espresso", milk: false), price: 15, countOfSugar: 0, count: 10),
                "Cappuccino": Item(drinks: Drinks(name: "Cappuccino", milk: true), price: 35, countOfSugar: 2, count: 10),
                "Hot Chocolate": Item(drinks: Drinks(name: "Hot Chocolate", milk: false), price: 20, countOfSugar: 0, count: 10)]
    var money = 0

    func coff(_ name: String) -> (Drinks?, coffeeError?){
        guard let item = list[name],
              item.count > 0,
              item.price <= money
        else { return (nil, coffeeError.countError) }

        money -= Int(item.price)
        var itemOne = item
        itemOne.count -= 1
        list[name] = itemOne
        print("Your drink is \(name)")
        return (itemOne.drinks, nil)
    }

}

var coffeeMachine = CoffeeMachine()
coffeeMachine.money = 70
coffeeMachine.coff("Latte")

coffeeMachine.money = 40
coffeeMachine.coff("Americano")

coffeeMachine.money = 60
coffeeMachine.coff("Espresso")


// MARK: Ручная мойка (2 метод)

enum WaterError: Error {
    case namesError
    case priseError
}

struct WaterItem {
    let water: Water
    let priseOne: UInt
    let foam: Bool
}

struct Water {
    let kindOfWater: String
}

class HandWashing {
    var serviceList = ["Tipe One": WaterItem(water: Water(kindOfWater: "Hot water"), priseOne: 10, foam: false),
                       "Tipe Two": WaterItem(water: Water(kindOfWater: "Cold water"), priseOne: 5, foam: false),
                       "Tipe Three": WaterItem(water: Water(kindOfWater: "Hot water with foam"), priseOne: 15, foam: true),
                       "Tipe Four": WaterItem(water: Water(kindOfWater: "Cold water with foam"), priseOne: 10, foam: true)]

    var cash = 0

    func wateer(_ kindOfWater: String) throws -> Water {

        guard let item = serviceList[kindOfWater] else {throw WaterError.namesError}
        guard item.priseOne <= cash else {throw WaterError.priseError}

        cash -= Int(item.priseOne)

        let itemTwo = item
        serviceList[kindOfWater] = itemTwo

        print("You chose \(kindOfWater)")

        return itemTwo.water
    }

}

let handWashing = HandWashing()
handWashing.cash = 10

do {
    let waterTwo = try handWashing.wateer("Cold water")
    print(waterTwo.kindOfWater)
} catch let eror {
    print(eror)
}
