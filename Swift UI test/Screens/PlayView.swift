import SwiftUI

struct PlayView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: randomIndexes initialization
    @State var randomIndexes: [Int] = {
        var uniqueIndexes = Set<Int>()
        while uniqueIndexes.count < 4 {
            uniqueIndexes.insert(Int.random(in: 0..<5))
        }
        return Array(uniqueIndexes)
    }()
    
    @State var correctIndex: Int = Int.random(in: 0..<4)
    
    @State var isCorrect: Bool = false
    @State var isCorrectInt: Int = 999
    
    @EnvironmentObject var point: Point
    @EnvironmentObject var cat: Cat
    @EnvironmentObject var kana: Kana
    @EnvironmentObject var customColor: CustomColor
    
    @State var walkAnimation: Bool = false
    @State var changeSprite: Bool = false
    @State var bounceSprite: Bool = false
    @State var startingSprite: Bool = true
    @State var showOptionsView: Bool = false
    @State var showShopView: Bool = false
    @State var jumpAnimation: Bool = false
    @State var jumpAnimation1: Bool = false
    @State var flowAnimation: Int = 0
    @State private var isOptionsViewPresented: Bool = false
    
    //MARK: correct and incorrect arrays
    let correctArray: [String] = [
        "Correct!",
        "Right!",
        "Yes!",
        "Good!",
        "Purrrfect!"
    ]

    let incorrectArray: [String] = [
        "Try again!",
        "Nope!",
        "Wrong!",
        "Incorrect!",
        "Oops!"
    ]
    
    @State var randomNum: Int = 0
    
    //MARK: kana arrays
    let hiraganaArray: [String] = ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "さ", "し", "す", "せ", "そ", "た", "ち", "つ", "て", "と", "な", "に", "ぬ", "ね", "の", "は", "ひ", "ふ", "へ", "ほ", "ま", "み", "む", "め", "も", "ら", "り", "る", "れ", "ろ", "や", "", "ゆ", "", "よ", "わ", "", "ん", "", "を"]/*, "が", "ぎ", "ぐ", "げ", "ご", "ざ" , "じ", "ず", "ぜ", "ぞ", "だ", "ぢ", "づ", "で", "ど", "ば", "び", "ぶ", "べ", "ぼ", "ぱ", "ぴ", "ぷ", "ぺ", "ぽ"]*/

    let romajiArray: [String] = ["a", "i", "u", "e", "o", "ka", "ki", "ku", "ke", "ko", "sa", "shi", "su", "se", "so", "ta", "chi", "tsu", "te", "to", "na", "ni", "nu", "ne", "no", "ha", "hi", "fu", "he", "ho", "ma", "mi", "mu", "me", "mo", "ra", "ri", "ru", "re", "ro", "ya", "", "yu", "", "yo", "wa", "", "n", "", "wo"]/*, "ga", "gi", "gu", "ge", "go", "za", "ji(shi)", "zu", "ze", "zo", "da", "ji(chi)", "zu", "de", "do", "ba", "bi", "bu", "be", "bo", "pa", "pi", "pu", "pe", "po"]*/
    
    
    
    var body: some View {
        //MARK: main ZStack
        ZStack {
            customColor.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //MARK: top HStack
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(customColor.firstTextColor)
                            .font(.largeTitle)
                            .padding()
                    }
                    .padding(20)
                    
                    Spacer()
                    
                    //MARK: points ZStack
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(customColor.fillColor)
                            .frame(width: 150, height: 70)
                            .frame(width: 155, height: 75)
                            .background(customColor.frameColor)
                            .cornerRadius(10)
                        VStack {
                            Text("KittKoins: 🏵 " + String(format: "%.0f", point.numOfCoins))
                                .font(.custom("Futura", size: 17))
                                .offset(y: jumpAnimation ? -8 : 0)
                                .scaleEffect(jumpAnimation ? 1.05 : 1)
                                .foregroundColor(customColor.firstTextColor)
                            Text("RiceBalls: 🍙 " + String(format: "%.0f", point.numOfRiceballs))
                                .font(.custom("Futura", size: 17))
                                .offset(y: jumpAnimation1 ? -8 : 0)
                                .scaleEffect(jumpAnimation1 ? 1.05 : 1)
                                .foregroundColor(customColor.firstTextColor)
                        }
                    }
                    .animation(.spring(response: 0.3, dampingFraction: 0.33), value: jumpAnimation)
                    .animation(.spring(response: 0.3, dampingFraction: 0.33), value: jumpAnimation1)
                    .onTapGesture {
                        showShopView.toggle()
                    }
                    .padding(.trailing, 25)
                }
                .padding(.top, 20)
                .padding(.bottom, 20)
                
                //MARK: answer display
                ZStack {
                    Image("MainScreenButtonPNG")
                        .resizable()
                        .frame(width: 350, height: 350)
                    Text(kana.hardModeChosen ? (kana.romajiArray[randomIndexes[correctIndex]]) : (kana.katakanaChosen ? kana.katakanaArray[randomIndexes[correctIndex]] : kana.hiraganaArray[randomIndexes[correctIndex]]))
                        .font(Font.custom("Futura", size: 130))
                        .foregroundColor(customColor.firstTextColor)
                }
                .padding(.all, -15)
                
                //MARK: walking cat HStack
                HStack {
                    VStack {
                        ZStack {
                            Image("Cloud")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .scaleEffect(x: bounceSprite ? 1 : -1)
                            Text(isCorrect ? correctArray[randomNum] : incorrectArray[randomNum])
                                .padding(.bottom, 23)
                                .font(Font.custom("Futura", size: 25))
                                .foregroundColor(customColor.firstTextColor)
                        }
                        .opacity(isCorrectInt == 0 ? 0 : (isCorrectInt == 999 ? 0 : 1))
                        .padding(.bottom, -20)
                        Image(changeSprite ? "Cat1P" : (startingSprite ? "Cat2F" : "Cat2P"))
                            .resizable()
                            .frame(width: startingSprite ? 120 : 200, height: 140)
                            //.padding(.bottom, 140)
                            .scaleEffect(x: bounceSprite ? 1 : -1)
                            .onTapGesture {
                                showOptionsView.toggle()
                                
                            }
                        
                    }
                    .frame(width: startingSprite ? 120 : 200, height: 140)
                    .offset(x: walkAnimation ? (UIScreen.main.bounds.width - 200) : 0) //200
                    .animation(Animation.linear(duration: 2.9), value: walkAnimation)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 2.9, repeats: true) {time in
                            startingSprite = false
                            withAnimation {
                                walkAnimation.toggle()
                            }
                            bounceSprite.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {time in
                                changeSprite.toggle()
                            }
                        }
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.top, -45)
                
                Spacer()
                Spacer()

                //MARK: pickbuttons HStack
                HStack {
                    VStack {
                        PickButton1(someString: kana.hardModeChosen ? kana.katakanaChosen ? kana.katakanaArray[randomIndexes[0]] : kana.hiraganaArray[randomIndexes[0]] : kana.romajiArray[randomIndexes[0]], randomIndexes: $randomIndexes, correctIndex: $correctIndex, isCorrect: $isCorrect, isCorrectInt: $isCorrectInt, randomNum: $randomNum, jumpAnimation: $jumpAnimation, jumpAnimation1: $jumpAnimation1, flowAnimation: $flowAnimation)
                            .padding(.bottom, -10)
                            .offset(y: flowAnimation == 1 ? 600 : 0)
                        PickButton2(someString: kana.hardModeChosen ? kana.katakanaChosen ? kana.katakanaArray[randomIndexes[1]] : kana.hiraganaArray[randomIndexes[1]] : kana.romajiArray[randomIndexes[1]], randomIndexes: $randomIndexes, correctIndex: $correctIndex, isCorrect: $isCorrect, isCorrectInt: $isCorrectInt, randomNum: $randomNum, jumpAnimation: $jumpAnimation, jumpAnimation1: $jumpAnimation1, flowAnimation: $flowAnimation)
                            .offset(y: flowAnimation == 2 ? 600 : 0)
                    }
                    VStack {
                        PickButton3(someString: kana.hardModeChosen ? kana.katakanaChosen ? kana.katakanaArray[randomIndexes[2]] : kana.hiraganaArray[randomIndexes[2]] : kana.romajiArray[randomIndexes[2]], randomIndexes: $randomIndexes, correctIndex: $correctIndex, isCorrect: $isCorrect, isCorrectInt: $isCorrectInt, randomNum: $randomNum, jumpAnimation: $jumpAnimation, jumpAnimation1: $jumpAnimation1, flowAnimation: $flowAnimation)
                            .padding(.bottom, -10)
                            .offset(y: flowAnimation == 3 ? 600 : 0)
                        PickButton4(someString: kana.hardModeChosen ? kana.katakanaChosen ? kana.katakanaArray[randomIndexes[3]] : kana.hiraganaArray[randomIndexes[3]] : kana.romajiArray[randomIndexes[3]], randomIndexes: $randomIndexes, correctIndex: $correctIndex, isCorrect: $isCorrect, isCorrectInt: $isCorrectInt, randomNum: $randomNum, jumpAnimation: $jumpAnimation, jumpAnimation1: $jumpAnimation1, flowAnimation: $flowAnimation)
                            .offset(y: flowAnimation == 4 ? 600 : 0)
                    }
                }
                
                Spacer()
            }
        }//MARK: main end
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            initializeRandomIndexes()
        }
        .fullScreenCover(isPresented: $showOptionsView) {
            KittensView()
        }
        .fullScreenCover(isPresented: $showShopView) {
            ShopView()
        }
        .onChange(of: showOptionsView) { newValue in
            if !showOptionsView {
                initializeRandomIndexes()
            }
        }
    }
    
    //MARK: randomIndexes initialization function
    func initializeRandomIndexes() {
            var uniqueIndexes = Set<Int>()
            while uniqueIndexes.count < 4 {
                let randomIndex = Int.random(in: cat.getKanaRange())
                if randomIndex != 41 && randomIndex != 43 && randomIndex != 46 && randomIndex != 48 {
                    uniqueIndexes.insert(randomIndex)
                }
            }
            randomIndexes = Array(uniqueIndexes)
        }
    
}

//MARK: preview
struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        let coin = Point()
        let cat = Cat()
        let kana = Kana()
        let customC = CustomColor()
        PlayView()
            .environmentObject(coin)
            .environmentObject(cat)
            .environmentObject(kana)
            .environmentObject(customC)
    }
}


