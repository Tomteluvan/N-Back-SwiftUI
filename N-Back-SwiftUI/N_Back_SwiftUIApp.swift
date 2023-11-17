//
//  N_Back_SwiftUIApp.swift
//  N-Back-SwiftUI
//
//  Created by Jonas Willén on 2023-09-19.
//

import SwiftUI

@main
struct N_Back_SwiftUIApp: App {
    @StateObject private var theViewModel = N_Back_SwiftUIVM()
    
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
                .environmentObject(theViewModel)
        }
    }
}
