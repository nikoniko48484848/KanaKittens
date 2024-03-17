//
//  FeedCatButton.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 28/11/2023.
//

import SwiftUI

struct FeedCatButton: View {
    
    @EnvironmentObject var cat: Cat
    @EnvironmentObject var point: Point
    @EnvironmentObject var customColor: CustomColor
    
    @State var foodNeeded: Double
    var foodFed: Double
    @State var feed: Bool
    var foodFedBonus: Double
    var catName: String
    
    
    var body: some View {
        Button {
            
            unlockCat()
            
            feedCat()
            
            excessFeed()
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 28.5)
                    .fill(.green)
                    .frame(maxWidth: feed ? 250 : 0)
                    .frame(height: 90)
                    .frame(width: 250, height: 90, alignment: .leading)
                    .background(customColor.frameColor)
                    .cornerRadius(28.5)
                VStack {
                    Text(foodNeeded == 0 ? "Unlock next cat" : foodNeeded == -1 ? "Feed " + catName + " more " + String(foodFed) : "Feed +" + String(foodFed) + "\nNeeded: " + String(foodNeeded))
                        .foregroundColor(customColor.firstTextColor)
                    
                }
            }
        }
        .offset(y: cat.catChosen == catName && foodNeeded != -1 ? 0 : 600)
        .animation(.linear(duration: 0.3), value: cat.catChosen == catName)
        .animation(.linear(duration: 0.3), value: foodNeeded)
        .disabled(feed ? true : false)
    }
    
    func excessFeed() {
        if point.numOfRiceballs >= foodFedBonus && foodNeeded < 0 {
            //foodNeeded = -1
            withAnimation(.linear(duration: 0.5)) {
                feed = true
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                point.numOfRiceballs -= foodFedBonus
                
                feed = false
            }
        }
    }
    
    func feedCat() {
        if point.numOfRiceballs >= foodFed && foodNeeded > 0 {
            withAnimation(.linear(duration: 0.5)) {
                feed = true
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                point.numOfRiceballs -= foodFed
                if foodNeeded > 0 {
                    withAnimation(.linear) {
                        foodNeeded -= foodFed
                    }
                } else {
                    foodNeeded = 0
                }
                
                
                feed = false
            }
        }
    }
    
    func unlockCat() {
        if foodNeeded == 0 {
            withAnimation(.linear(duration: 0.3)) {
                switch catName {
                case "Ai":
                    cat.kittenCellsArray[1].unlocked = true
                    cat.kittenCellsArray[0].fullBelly = true
                case "Kiko":
                    cat.kittenCellsArray[2].unlocked = true
                    cat.kittenCellsArray[1].fullBelly = true
                case "Sushi":
                    cat.kittenCellsArray[3].unlocked = true
                    cat.kittenCellsArray[2].fullBelly = true
                case "Tofu":
                    cat.kittenCellsArray[4].unlocked = true
                    cat.kittenCellsArray[3].fullBelly = true
                case "Nono":
                    cat.kittenCellsArray[5].unlocked = true
                    cat.kittenCellsArray[4].fullBelly = true
                case "Haru":
                    cat.kittenCellsArray[6].unlocked = true
                    cat.kittenCellsArray[5].fullBelly = true
                case "Minami":
                    cat.kittenCellsArray[7].unlocked = true
                    cat.kittenCellsArray[6].fullBelly = true
                case "Rio":
                    cat.kittenCellsArray[8].unlocked = true
                    cat.kittenCellsArray[7].fullBelly = true
                case "Yuki":
                    cat.kittenCellsArray[8].fullBelly = true
                default:
                    return
                }
                foodNeeded = -1
            }
        }
    }
}

//#Preview {
//    FeedCatButton()
//}
