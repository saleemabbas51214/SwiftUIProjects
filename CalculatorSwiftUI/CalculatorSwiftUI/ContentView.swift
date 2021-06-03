//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Saleem Abbas on 03.06.21.
//

import SwiftUI


enum CalculatorButton: String {
    case zero, one , two , three, four , five , six , seven , eight,nine
    case equals , plus , minus , multiply , divide
    case decimal
    case ac , plusMinus , percent
    
    
    var title : String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "*"
        case .divide: return "/"
        case .plusMinus: return "+/-"
        case .percent: return "%"
        case .decimal: return "."
        case .equals: return "="
        default:
            return "AC"
        }
    }
    
    var backgroundColor : Color {
        switch self {
        case .zero,.one,.two,.three,.four,.five,.six , .seven,.eight,.nine:
            return Color(.darkGray)
        case .ac,.plusMinus,.percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
}


class GlobalEnvironment: ObservableObject {
    
    @Published var display = ""
    
    func receiveInput(calculatorButton: CalculatorButton)  {
        self.display = calculatorButton.title
    }
    
}


struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    let butttons :
        [[CalculatorButton]] = [
            [.ac,.plusMinus,.percent,.divide],
            [.seven,.eight,.nine,.multiply],
            [.four,.five,.six,.minus],
            [.one,.two,.three,.plus],
            [.zero,.decimal,.equals]
        ]
    
    var body: some View {
        
        ZStack(alignment : .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                HStack {
                    Spacer()
                    Text(env.display).foregroundColor(.white)
                        .font(.system(size: 64))
                }
                
                ForEach (butttons , id: \.self) { row in
                    HStack {
                        ForEach (row , id: \.self) { button in
                            
                            CalculatorButtonView(button: button)
                            
                        }
                    }
                }
            }
        }
        
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12").environmentObject(GlobalEnvironment())
    }
}
