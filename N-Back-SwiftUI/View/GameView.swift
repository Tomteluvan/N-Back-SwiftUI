//
//  GameView.swift
//  N-Back-SwiftUI
//
//  Created by Mikael Broström on 2023-11-15.
//

import SwiftUI

struct GameView: View {
    
    var body: some View {
        ZStack {
            Color(red: 134/255, green: 185/255, blue: 237/255).edgesIgnoringSafeArea(.all)
            VStack {
                GridView()
                ActionView()
            }
        }
 
    }
}

struct GameView_Preview : PreviewProvider {
    static var previews: some View {
        let theViewModel = N_Back_SwiftUIVM()
        GameView().environmentObject(theViewModel)
    }
}
