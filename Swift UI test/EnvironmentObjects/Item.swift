//
//  Item.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 30/07/2023.
//

import Foundation

class Item: ObservableObject {
    
    @Published var chosenItems: [ItemButton] = [
        ItemButton(name: "hat_none", type: "hat", bought: true, price: 0),
        ItemButton(name: "bed_none", type: "bed", bought: true, price: 0),
        ItemButton(name: "toy_none", type: "toy", bought: true, price: 0),
        ItemButton(name: "bowl_none", type: "bowl", bought: true, price: 0)
    ]
    
    @Published var pickedItems: [ItemButton] = [
        ItemButton(name: "hat_none", type: "hat", bought: true, price: 0),
        ItemButton(name: "bed_none", type: "bed", bought: true, price: 0),
        ItemButton(name: "toy_none", type: "toy", bought: true, price: 0),
        ItemButton(name: "bowl_none", type: "bowl", bought: true, price: 0)
    ]
    
    @Published var hatsArray: [ItemButton] = [
        ItemButton(name: "hat_none", type: "hat", bought: true, price: 0),
        ItemButton(name: "basic_hat", type: "hat", bought: false, price: 0),
        ItemButton(name: "whey_hat", type: "hat", bought: false, price: 0),
        ItemButton(name: "fedora", type: "hat", bought: false, price: 0),
        ItemButton(name: "sombrero", type: "hat", bought: false, price: 0),
        ItemButton(name: "baseball_cap", type: "hat", bought: false, price: 0),
        ItemButton(name: "kawaii_cap", type: "hat", bought: false, price: 0),
        ItemButton(name: "crown", type: "hat", bought: false, price: 0)
    ]
    
    @Published var bedsArray: [ItemButton] = [
        ItemButton(name: "bed_none", type: "bed", bought: true, price: 0),
        ItemButton(name: "basic_bed", type: "bed", bought: false, price: 0),
        ItemButton(name: "whey_bed", type: "bed", bought: false, price: 0),
        ItemButton(name: "elegant_bed", type: "bed", bought: false, price: 0),
        ItemButton(name: "burito_bed", type: "bed", bought: false, price: 0),
        ItemButton(name: "sport_bed", type: "bed", bought: false, price: 0),
        ItemButton(name: "kawaii_bed", type: "bed", bought: false, price: 0),
        ItemButton(name: "kings_bed", type: "bed", bought: false, price: 0)
    ]
    
    @Published var toysArray: [ItemButton] = [
        ItemButton(name: "toy_none", type: "toy", bought: true, price: 0),
        ItemButton(name: "basic_toy", type: "toy", bought: false, price: 0),
        ItemButton(name: "wheyfork", type: "toy", bought: false, price: 0),
        ItemButton(name: "suit_stand", type: "toy", bought: false, price: 0),
        ItemButton(name: "fethers", type: "toy", bought: false, price: 0),
        ItemButton(name: "tennis_ball", type: "toy", bought: false, price: 0),
        ItemButton(name: "pink_wool", type: "toy", bought: false, price: 0),
        ItemButton(name: "huge_diamond", type: "toy", bought: false, price: 0)
    ]
    
    @Published var bowlsArray: [ItemButton] = [
        ItemButton(name: "bowl_none", type: "bowl", bought: true, price: 0),
        ItemButton(name: "basic_bowl", type: "bowl", bought: false, price: 0),
        ItemButton(name: "farmers_bowl", type: "bowl", bought: false, price: 0),
        ItemButton(name: "elegant_bowl", type: "bowl", bought: false, price: 0),
        ItemButton(name: "mexican_bowl", type: "bowl", bought: false, price: 0),
        ItemButton(name: "sports_bowl", type: "bowl", bought: false, price: 0),
        ItemButton(name: "kawaii_bowl", type: "bowl", bought: false, price: 0),
        ItemButton(name: "kings_bowl", type: "bowl", bought: false, price: 0)
    ]
}
