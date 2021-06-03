//
//  CalculatorSwiftUIApp.swift
//  CalculatorSwiftUI
//
//  Created by Saleem Abbas on 03.06.21.
//

import SwiftUI

@main
struct CalculatorSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(GlobalEnvironment())
        }
    }
}
