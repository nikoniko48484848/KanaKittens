//
//  ShopView.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 30/07/2023.
//

import SwiftUI

struct ShopView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var customColor: CustomColor
    @EnvironmentObject var point: Point
    @EnvironmentObject var item: Item
    
    @State var typeChosen: Int = 0
    @State var buy: Bool = false
    @State var ask: Bool = false
    
    var body: some View {
        ZStack {
            customColor.backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.largeTitle)
                                .padding()
                        }
                        Spacer()
                    }
                    .frame(width: 400)
                    
                    //MARK: shop type buttons
                    VStack {
                        HStack {
                            ShopTypeButton(name: "Hats")
                                .onTapGesture {
                                    typeChosen = 0
                                }
                            ShopTypeButton(name: "Beds")
                                .onTapGesture {
                                    typeChosen = 1
                                }
                        }
                        HStack {
                            ShopTypeButton(name: "Toys")
                                .onTapGesture {
                                    typeChosen = 2
                                }
                            ShopTypeButton(name: "Bowls")
                                .onTapGesture {
                                    typeChosen = 3
                                }
                        }
                    }
                    .padding(.bottom, 20)
                    
                    //MARK: whole grid
                    ZStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(customColor.fillColor)
                                .frame(width: 270, height: 150)
                                .frame(width: 280, height: 160)
                                .background(customColor.frameColor)
                                .cornerRadius(12)
                            VStack {
                                Text("Are you sure you want to buy this item?")
                                    .font(Font.custom("Futura", size: 15))
                                    .foregroundColor(customColor.firstTextColor)
                                    .frame(width: 220)
                                    .padding(.bottom, -30)
                                Image(item.pickedItems[typeChosen].name)
                                    .resizable()
                                    .frame(width: 60, height: 70)
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(customColor.fillColor)
                                            .frame(width: 100, height: 55)
                                            .frame(width: 110, height: 65)
                                            .background(customColor.frameColor)
                                            .cornerRadius(12)
                                        Text("Yes")
                                            .font(Font.custom("Futura", size: 10))
                                            .foregroundColor(customColor.firstTextColor)
                                    }
                                    .onTapGesture {
                                        ask = false
                                        point.numOfCoins -= item.pickedItems[typeChosen].price
                                        item.pickedItems[typeChosen].bought = true
                                    }
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(customColor.fillColor)
                                            .frame(width: 100, height: 55)
                                            .frame(width: 110, height: 65)
                                            .background(customColor.frameColor)
                                            .cornerRadius(12)
                                        Text("No")
                                            .font(Font.custom("Futura", size: 10))
                                            .foregroundColor(customColor.firstTextColor)
                                    }
                                    .onTapGesture {
                                        ask = false
                                    }
                                }
                                .padding(.top, -50)
                            }
                        }
                            .opacity(ask ? 1 : 0)
                            .zIndex(ask ? 1 : -1)
                            .animation(.linear(duration: 0.1), value: ask)
                        HStack(spacing: 30) {
                            
                            //MARK: hats grid
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(customColor.frameColor)
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(customColor.frameColor)
                                    .frame(width: 366, height: 240)
                                ScrollView {
                                    VStack {
                                        HStack {
                                            item.hatsArray[0]
                                            item.hatsArray[1]
                                            item.hatsArray[2]
                                        }
                                        HStack {
                                            item.hatsArray[3]
                                            item.hatsArray[4]
                                            item.hatsArray[5]
                                        }
                                        HStack {
                                            item.hatsArray[6]
                                            item.hatsArray[7]
                                            Spacer()
                                        }
                                    }
                                }
                                .frame(width: 346, height: 220)
                                .background(customColor.frameColor)
                                .cornerRadius(15)
                            }
                            .frame(width: 376, height: 250)
                            
                            //MARK: beds grid
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(customColor.frameColor)
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(customColor.frameColor)
                                    .frame(width: 366, height: 240)
                                ScrollView {
                                    VStack {
                                        HStack {
                                            item.bedsArray[0]
                                            item.bedsArray[1]
                                            item.bedsArray[2]
                                        }
                                        HStack {
                                            item.bedsArray[3]
                                            item.bedsArray[4]
                                            item.bedsArray[5]
                                        }
                                        HStack {
                                            item.bedsArray[6]
                                            item.bedsArray[7]
                                            Spacer()
                                        }
                                    }
                                }
                                .frame(width: 346, height: 220)
                                .background(customColor.frameColor)
                                .cornerRadius(15)
                            }
                            .frame(width: 376, height: 250)
                            
                            //MARK: toys grid
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(customColor.frameColor)
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(customColor.frameColor)
                                    .frame(width: 366, height: 240)
                                ScrollView {
                                    VStack {
                                        HStack {
                                            item.toysArray[0]
                                            item.toysArray[1]
                                            item.toysArray[2]
                                        }
                                        HStack {
                                            item.toysArray[3]
                                            item.toysArray[4]
                                            item.toysArray[5]
                                        }
                                        HStack {
                                            item.toysArray[6]
                                            item.toysArray[7]
                                            Spacer()
                                        }
                                    }
                                }
                                .frame(width: 346, height: 220)
                                .background(customColor.frameColor)
                                .cornerRadius(15)
                            }
                            .frame(width: 376, height: 250)
                            
                            //MARK: bowls grid
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(customColor.frameColor)
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(customColor.frameColor)
                                    .frame(width: 366, height: 240)
                                ScrollView {
                                    VStack {
                                        HStack {
                                            item.bowlsArray[0]
                                            item.bowlsArray[1]
                                            item.bowlsArray[2]
                                        }
                                        HStack {
                                            item.bowlsArray[3]
                                            item.bowlsArray[4]
                                            item.bowlsArray[5]
                                        }
                                        HStack {
                                            item.bowlsArray[6]
                                            item.bowlsArray[7]
                                            Spacer()
                                        }
                                    }
                                }
                                .frame(width: 346, height: 220)
                                .background(customColor.frameColor)
                                .cornerRadius(15)
                            }
                            .frame(width: 376, height: 250)
                            
                        }
                        .offset(x: typeChosen == 0 ? 610 : typeChosen == 1 ? 204 : typeChosen == 2 ? -202 : -608)
                        .animation(.easeOut(duration: 0.3), value: typeChosen)
                    }
                    
                    //MARK: buy button
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.green) //.green
                            .frame(maxWidth: buy ? 250 : 0)
                            .frame(height: 55)
                            .frame(width: 250, height: 55, alignment: .leading)
                            .background(customColor.frameColor)
                            .cornerRadius(15)
                        Text("Buy")
                            .font(Font.custom("Futura", size: 25))
                            .foregroundColor(customColor.secondaryTextColor)
                    }
                    .onTapGesture {
                        if point.numOfCoins >= item.pickedItems[typeChosen].price && !item.pickedItems[typeChosen].bought {
                            withAnimation(.linear(duration: 0.3)) {
                                buy = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
//                                point.numOfCoins -= item.pickedItems[typeChosen].price
//                                item.pickedItems[typeChosen].bought = true
                                ask = true
                                buy = false
                            }
                        }
                    }
                    .padding(.bottom, -10)
                    .padding(.top, 10)
                    .animation(.linear(duration: 0.1), value: ask)
                    
                    //MARK: cat presentation
                    HStack (alignment: .bottom) {
                        Image("bed_none")
                            .resizable()
                            .frame(width: 180, height: 230)
                            .padding(.bottom, -70)
                            .padding(.leading, -55)
                        Image("Cat2F")
                            .resizable()
                            .frame(width: 140, height: 220)
                            .padding(.leading, -40)
                        Image("cattoyexample")
                            .resizable()
                            .frame(width: 70, height: 70)
                    }
                    .frame(height: 300)
                }
                Spacer()
            }
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        // Step 1: Create a preview instance of CustomColor
        let customColor = CustomColor()
        let item = Item()
        let point = Point()

        // Step 2: Pass the preview instance to ShopView using .environmentObject
        return ShopView()
            .environmentObject(customColor)
            .environmentObject(item)
            .environmentObject(point)
    }
}
