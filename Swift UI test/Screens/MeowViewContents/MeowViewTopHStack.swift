//
//  MeowViewTopHStack.swift
//  Swift UI test
//
//  Created by Oliwia Piątkiewicz on 19/07/2023.
//

import SwiftUI

struct MeowViewTopHStack: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var customColor: CustomColor
    
    var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(customColor.firstTextColor)
                .font(.largeTitle)
                .padding(.leading, 30)
        }
        Spacer()
        Text("Meow by yourself")
            .font(Font.custom("Futura", fixedSize: 30))
            .padding(.trailing, 45)
            .foregroundColor(customColor.firstTextColor)
    }
}

//MARK: preview
struct MeowViewTopHStack_Previews: PreviewProvider {
    static var previews: some View {
        MeowViewTopHStack()
    }
}
