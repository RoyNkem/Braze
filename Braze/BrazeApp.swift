//
//  BrazeApp.swift
//  Braze
//
//  Created by Roy Aiyetin on 26/09/2022.
//

import SwiftUI

@main
struct BrazeApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm) // If a view uses an @EnvironmentObject, you must create the model object by calling the environmentObject(_:) modifier on an ancestor view. HomeView uses the ThingStore object, so you create it in BrazeApp.swift when it creates HomeView
        }
    }
}
