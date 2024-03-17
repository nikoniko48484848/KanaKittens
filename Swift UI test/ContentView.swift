//
//  ContentView.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 12/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var showMeowSheet: Bool = false
    @State var showChooseView: Bool = false
    @State var showKittensView: Bool = false
    @State var showShopView: Bool = false
    @State var selection: String = "Rōmaji"
    @State var clicked: Bool = false
    @State var coins: Int = 0
    @StateObject var point: Point = Point()
    @StateObject var cat: Cat = Cat()
    @StateObject var kana: Kana = Kana()
    @StateObject var customColor: CustomColor = CustomColor()
    @StateObject var item: Item = Item()
    
    let options: [String] = [
        "Hiragana",
        "Rōmaji",
        "Katakana"
    ]
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            //MARK: main VStack
            VStack {
                
                //MARK: top HStack
                HStack {
                    
                    //MARK: points Zstack
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(customColor.fillColor)
                            .frame(width: 120, height: 50)
                            .frame(width: 125, height: 55)
                            .background(customColor.frameColor)
                            .cornerRadius(10)
                        VStack {
                            Text("KittKoins: 🏵 " + String(format: "%.0f", point.numOfCoins))
                                .font(.custom("Futura", size: 14))
                            Text("RiceBalls: 🍙 " + String(format: "%.0f", point.numOfRiceballs))
                                .font(.custom("Futura", size: 14))
                        }
                    }
                    .padding()
                    .onTapGesture {
                        showShopView.toggle()
                    }
                    
                    Spacer()
                    
                    //MARK: change alphabets picker VStack
                    VStack {
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                clicked.toggle()
                            }
                        } label: {
                            Image("CatHead")
                                .resizable()
                                .frame(width: 74, height: 58)
                        }
                        ZStack {
                            if clicked {
                                Picker("", selection: $selection) {
                                    ForEach(0..<3) { index in
                                        Text(options[index])
                                            .tag(options[index])
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .background(Color(red: 1, green: 0.6, blue: 0.4).opacity(0.5))
                                .cornerRadius(10)
                            } else {
                                Text("Click me!!")
                                    .font(Font.custom("Futura", size: 20))
                            }
                        }
                    }
                    .padding()
                    
                }
                .frame(height: 130)
                .frame(maxWidth: .infinity)
                
                //MARK: title image
                Image("TitleTextPNG")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 315, height: 80)
                
                Spacer()
                Spacer()
                
                //MARK: buttons Group
                Group {
                    Button {
                        showChooseView.toggle()
                    } label: {
                        MainScreenButtonStyle(text: selection == "Rōmaji" ? "Play" : selection == "Hiragana" ? "あそぶ" : "プレイ")
                    }
                    .padding(.bottom, -10)
                    HStack(spacing: 35) {
                        Button {
                            showKittensView.toggle()
                        } label: {
                            MainScreenButtonStyle(text: selection == "Rōmaji" ? "Kittens" : selection == "Hiragana" ? "こねこ" : "コネコ")
                        }

                        Button {
                            showMeowSheet.toggle()
                        } label: {
                            MainScreenButtonStyle(text: selection == "Rōmaji" ? "Meow" : selection == "Hiragana" ? "にゃー" : "ニャー")
                        }
                    }
                }
                
                Spacer()
            }
            .sheet(isPresented: $showMeowSheet, content: {
                MeowView()
            })
            .fullScreenCover(isPresented: $showKittensView, content:  {
                KittensView()
            })
            .fullScreenCover(isPresented: $showChooseView, content: {
                ChooseView()
            })
            .fullScreenCover(isPresented: $showShopView, content: {
                ShopView()
            })
        }
        .frame(maxWidth: .infinity)
        .animation(.easeIn, value: selection)
        .environmentObject(point)
        .environmentObject(cat)
        .environmentObject(kana)
        .environmentObject(customColor)
        .environmentObject(item)

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(showMeowSheet: false)
        let customColor = CustomColor()
        let point = Point()
        let cat = Cat()
        let kana = Kana()
        let item = Item()
        MeowView()
            .environmentObject(point)
            .environmentObject(cat)
            .environmentObject(kana)
            .environmentObject(customColor)
            .environmentObject(item)

    }
}



