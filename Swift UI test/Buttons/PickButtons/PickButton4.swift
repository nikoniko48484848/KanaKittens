//
//  PickButton4.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 16/07/2023.
//

import SwiftUI

struct PickButton4: View {
    
    var someString: String
    @Binding var randomIndexes: [Int]
    @Binding var correctIndex: Int
    @Binding var isCorrect: Bool
    @Binding var isCorrectInt: Int
    @Binding var randomNum: Int
    @Binding var jumpAnimation: Bool
    @Binding var jumpAnimation1: Bool
    @Binding var flowAnimation: Int
    
    @State var clear: Bool = false
    
    @EnvironmentObject var point: Point
    @EnvironmentObject var cat: Cat
    @EnvironmentObject var kana: Kana
    @EnvironmentObject var customColor: CustomColor
 
    var body: some View {
        Button {
            isCorrect = correctIndex == 3 ? true : false
            randomNum = randomNumGenerator(from: 0, to: 5)
            if isCorrect {
                point.numOfCoins += point.coinsGrowth
                point.numOfRiceballs += point.riceBallsGrowth
            }
            withAnimation(.linear(duration: 0.3)) {
                isCorrectInt = correctIndex == 3 ? 1 : -1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                withAnimation(.linear(duration: 0.3)) {
                    isCorrectInt = 0
                }
            }
            
            kana.clear = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                kana.clear = false
            }
            
            //MARK: flow off and to screen animation
            withAnimation(.linear(duration: 0.3)) {
                flowAnimation = 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.linear(duration: 0.3)) {
                    flowAnimation = 3
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.linear(duration: 0.3)) {
                    flowAnimation = 2
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.linear(duration: 0.3)) {
                    flowAnimation = 4
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.linear(duration: 0.3)) {
                    flowAnimation = 0
                }
            }
            
            
            //jumpAnimation for points
            jumpAnimation = isCorrect ? true : false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.33) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.33)) {
                    jumpAnimation = false
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.33)) {
                    jumpAnimation1 = isCorrect ? true : false
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.33)) {
                    jumpAnimation1 = false
                }
            }
            
            let previousCorrectAnswer = randomIndexes[correctIndex]
            var uniqueIndexes = Set<Int>()
                while uniqueIndexes.count < 4 {
                    let randomIndex = Int.random(in: cat.getKanaRange()) //TUTAJ RZEDY
                    if randomIndex != previousCorrectAnswer && randomIndex != 41 && randomIndex != 43 && randomIndex != 46 && randomIndex != 48 {
                        uniqueIndexes.insert(randomIndex)
                    }
                }
            randomIndexes = Array(uniqueIndexes)
            let previousCorrectIndex = correctIndex
            var newCorrectIndex = Int.random(in: 0..<4)
            while newCorrectIndex == previousCorrectIndex {
                newCorrectIndex = Int.random(in: 0..<4)
            }
            correctIndex = newCorrectIndex
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(customColor.frameColor)
                    .frame(width: 200, height: 100)
                RoundedRectangle(cornerRadius: 28.5)
                    .fill(customColor.fillColor)
                    .frame(width: 190, height: 90)
                Text(kana.clear ? "" : someString)
                    .font(Font.custom("futura", size: 50))
                    .foregroundColor(customColor.firstTextColor)
            }
        }
        .disabled(isCorrectInt == 0 ? false : true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                isCorrectInt = 0
            }
        }
    }
    func randomNumGenerator(from: Int, to: Int) -> Int {
        return Int.random(in: from..<to)
    }
}

//struct PickButton4_Previews: PreviewProvider {
//    static var previews: some View {
//        PickButton4()
//    }
//}
