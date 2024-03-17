//
//  ItemButton.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 30/07/2023.
//

import SwiftUI

struct ItemButton: View {
    
    @EnvironmentObject var customColor: CustomColor
    @EnvironmentObject var item: Item
    
    @State var name: String
    @State var type: String
    @State var bought: Bool
    @State var price: Double
    
    var body: some View {
        Button {
            pickItem()
            if bought {
                chooseItem()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 23)
                    .fill(customColor.fillColor)
                    .frame(width: 100, height: 100)
                    .frame(width: 110, height: 110)
                    .background(picked() ? .white : customColor.frameColor)
                    .cornerRadius(25)
                Text(name)
                    .font(Font.custom("Futura", size: 15))
                    .foregroundColor(customColor.firstTextColor)
            }
        }
        .colorMultiply(bought ? .white : .gray)
    }
    
    func chooseItem() {
        switch type {
        case "hat":
            item.chosenItems[0] = self
        case "bed":
            item.chosenItems[1] = self
        case "toy":
            item.chosenItems[2] = self
        case "bowl":
            item.chosenItems[3] = self
        default:
            return
        }
    }
    
    func pickItem() {
        switch type {
        case "hat":
            item.pickedItems[0] = self
        case "bed":
            item.pickedItems[1] = self
        case "toy":
            item.pickedItems[2] = self
        case "bowl":
            item.pickedItems[3] = self
        default:
            return
        }
    }
    
    func picked() -> Bool {
        return item.pickedItems.contains { pickedItem in
            pickedItem.name == self.name
        }
    }
}


