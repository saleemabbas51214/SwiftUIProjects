//
//  CalculatorButtonView.swift
//  CalculatorSwiftUI
//
//  Created by Saleem Abbas on 03.06.21.
//

import Foundation
import SwiftUI

struct CalculatorButtonView: View {
    
    var button: CalculatorButton
    
    @EnvironmentObject var env: GlobalEnvironment
    
    var body: some View {
        
        
        Button(action: {
            
            self.env.receiveInput(calculatorButton: button)
            
        }) {
            
            Text(button.title)
                .font(.system(size: 32))
                .frame(width: self.buttonWidthHeight(button: button) , height: UIScreen.main.bounds.width / 5)
                .foregroundColor(.white)
                .background(button.backgroundColor)
                .cornerRadius(self.buttonWidthHeight(button: button))
                .padding(0.5)
        }
        
    }
    
    // generalizing function for width height
    fileprivate func buttonWidthHeight(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return UIScreen.main.bounds.width / 5 * 2
        }
        return UIScreen.main.bounds.width / 5
    }
    
}
