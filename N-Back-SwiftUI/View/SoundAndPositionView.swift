//
//  SoundAndPositionView.swift
//  N-Back-SwiftUI
//
//  Created by Mikael Broström on 2023-11-17.
//

import SwiftUI

struct SoundAndPositionView: View {
    @EnvironmentObject var theViewModel : N_Back_SwiftUIVM
    var body: some View {
        VStack {
            GridView()
            SoundGameView()
            
            Button() {
                theViewModel.startBothGames()
            } label: {
                Text("START BOTH GAMES")
            }
        }
    }
}

struct SoundAndPositionView_Preview: PreviewProvider {
    static var previews: some View {
        let theViewModel = N_Back_SwiftUIVM()
        SoundAndPositionView().environmentObject(theViewModel)
    }
}
