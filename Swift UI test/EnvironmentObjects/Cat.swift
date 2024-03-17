//
//  Cat.swift
//  Swift UI test
//
//  Created by Oliwia Piątkiewicz on 20/07/2023.
//

import Foundation

class Cat: ObservableObject {
    @Published var catChosen: String = "Ai"
    @Published var currentRange: Range = 0..<5
    
    @Published var kittenCellsArray: [KittensViewCell] = [
        KittensViewCell(catName: "Ai", foodNeeded: 20, foodFed: 5, unlocked: true, fullBelly: false),
        KittensViewCell(catName: "Kiko", foodNeeded: 10, foodFed: 5, unlocked: true, fullBelly: false),
        KittensViewCell(catName: "Sushi", foodNeeded: 20, foodFed: 5, unlocked: false, fullBelly: false),
        KittensViewCell(catName: "Tofu", foodNeeded: 30, foodFed: 5, unlocked: false, fullBelly: false),
        KittensViewCell(catName: "Nono", foodNeeded: 40, foodFed: 5, unlocked: false, fullBelly: false),
        KittensViewCell(catName: "Haru", foodNeeded: 50, foodFed: 5, unlocked: false, fullBelly: false),
        KittensViewCell(catName: "Minami", foodNeeded: 60, foodFed: 5, unlocked: false, fullBelly: false),
        KittensViewCell(catName: "Rio", foodNeeded: 70, foodFed: 5, unlocked: false, fullBelly: false),
        KittensViewCell(catName: "Yuki", foodNeeded: 80, foodFed: 5, unlocked: false, fullBelly: false)
    ]
    
    //returns range of characters for catChosen
    func getKanaRange() -> Range<Int> {
        switch catChosen {
        case "Ai":
            return 0..<5 //a i u e o
        case "Kiko":
            return 5..<10 //ka ki ku ke ko
        case "Sushi":
            return 10..<15 //sa shi su se so
        case "Tofu":
            return 15..<20 //ta chi tsu te to
        case "Nono":
            return 20..<25 //na ni nu ne no
        case "Haru":
            return 25..<30 //ha hi fu he ho
        case "Minami":
            return 30..<35 //ma mi mu me mo
        case "Rio":
            return 35..<40 //ra ri ru re ro
        case "Yuki":
            return 40..<50 //ya yu yo wa n wo
        default:
            return 0..<0
        }
    }
}
