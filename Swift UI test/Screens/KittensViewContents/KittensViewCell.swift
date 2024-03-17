//
//  KittensViewCell.swift
//  Swift UI test
//
//  Created by Oliwia Piątkiewicz on 20/07/2023.
//

import SwiftUI

struct KittensViewCell: View {
    
    @EnvironmentObject var cat: Cat
    @EnvironmentObject var point: Point
    @EnvironmentObject var customColor: CustomColor
    
    @State var catName: String
    @State var changeColor: Bool = false
    @State var previousCat: String = ""
    @State var isSuccess: Bool = false
    @State var foodNeeded: Double
    @State var foodFed: Double
    @State var foodFedBonus: Double = 5
    @State var feed: Bool = false
    var unlocked: Bool
    var fullBelly: Bool
    //@State var full: Bool
    //@State var isClickable: Bool
    
    var body: some View {
        //MARK: main VStack
        VStack {
            //cat image
            CatImage()
            
            //cat name
            CatNameView(catName: catName)
            
            //MARK: description ZStack
            CatDescription(catName: catName)
            
            //MARK: feed cat button
            FeedCatButton(foodNeeded: foodNeeded, foodFed: foodFed, feed: feed, foodFedBonus: foodFedBonus, catName: catName)
            
        }//MARK: main end
        .onTapGesture {
            withAnimation(.linear(duration: 0.3)) {
                if unlocked {
                    cat.catChosen = catName
                }
            }
        }
        .colorMultiply(unlocked ? Color.white : .gray)
        //.opacity(1 - foodNeeded / 100)
    }
    
    
    
    
    //MARK: preview
//    struct KittensViewCell_Previews: PreviewProvider {
//        static var previews: some View {
//            let cat = Cat()
//            return KittensViewCell(catName: "Kiko", foodNeeded: 50, foodFed: 0, unlocked: true, fullBelly: false)
//                .environmentObject(cat)
//        }
//    }
    
}
