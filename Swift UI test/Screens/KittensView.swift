//
//  OptionsView.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 14/07/2023.
//

import SwiftUI

struct KittensView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    //@State var unlocked: Bool = true
    
    //MARK: kittenCellsArray
    
    
    @EnvironmentObject var cat: Cat
    @EnvironmentObject var point: Point
    @EnvironmentObject var customColor: CustomColor
    
    var body: some View {
        //MARK: main ZStack
        ZStack {
            customColor.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //MARK: top HStack
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(customColor.firstTextColor)
                            .font(.largeTitle)
                    }
                    .padding(20)
                    Spacer()
                    Text("food: " + String(point.numOfRiceballs))
                        .foregroundColor(customColor.firstTextColor)
                }
                
                Spacer()
                
                //MARK: horizontal ScrollView
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<9) { i in
                            GeometryReader { geo in
                                cat.kittenCellsArray[i]
                                    .rotation3DEffect(Angle(degrees: getPercentage(geo: geo, type: "rotation3D") * -20), axis: (x: 0, y: 1, z: 0))
                                    .scaleEffect(1 * getPercentage(geo: geo, type: "scale"))
                                Text(String(UIScreen.main.bounds.width / 2))
                                    .padding()
                                Text(String(getPercentage(geo: geo, type: "scale")))
                            }
                            .frame(width: 300)
                        }
                    }
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                }
                .frame(width: 400)
                .padding(.top, 100)
                
                Spacer()
            }
        }//MARK: main end
        .onDisappear {
            cat.currentRange = cat.getKanaRange()
        }
    }
    
    //MARK: *FUNC* returns percentage of change for GeometryReader
    func getPercentage(geo: GeometryProxy, type: String) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        let currentXScale = abs(geo.frame(in: .global).midX - UIScreen.main.bounds.midX) / 8
        
        switch type {
        case "rotation3D":
            return Double(1 - (currentX / maxDistance))
        case "scale":
            return Double(1 - (currentXScale / maxDistance))
        case "clickable":
            return abs(maxDistance - currentX)
        default:
            return Double(currentX)
        }
    }
    
}

//MARK: preview
struct KittensView_Previews: PreviewProvider {
    static var previews: some View {
        let cat = Cat()
        let customC = CustomColor()
        let point = Point()
        return KittensView()
            .environmentObject(cat)
            .environmentObject(customC)
            .environmentObject(point)
    }
}


