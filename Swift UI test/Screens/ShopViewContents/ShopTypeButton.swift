//
//  shopTypeButton.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 30/07/2023.
//

import SwiftUI

struct ShopTypeButton: View {
    
    @EnvironmentObject var customColor: CustomColor
    
    @State var name: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(customColor.fillColor)
                .frame(width: 180, height: 55)
                .frame(width: 190, height: 65)
                .background(customColor.frameColor)
                .cornerRadius(16)
            Text(name)
                .font(Font.custom("Futura", size: 23))
                .foregroundColor(customColor.firstTextColor)
        }
    }
}

//struct shopTypeButton_Previews: PreviewProvider {
//    static var previews: some View {
//        shopTypeButton()
//    }
//}
