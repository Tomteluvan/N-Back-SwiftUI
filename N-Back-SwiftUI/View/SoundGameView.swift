//
//  SoundGameView.swift
//  N-Back-SwiftUI
//
//  Created by Mikael Broström on 2023-11-17.
//

import SwiftUI

struct SoundGameView: View {
    @EnvironmentObject var theViewModel : N_Back_SwiftUIVM
    var body: some View {
        VStack {
            Text("current score: \(theViewModel.currentScore)")
            Text("current highscore: \(theViewModel.highScore)")
            Text("Event: \(theViewModel.currentIndex) / \(theViewModel.numberOfEvents)")
            Spacer()
            
            Button() {
                theViewModel.trySound()
            } label: {
                Text("YEAH SAME SOUND, PRESS PRESS")
            }
            Spacer()
            
            Button() {
                theViewModel.startSoundPlayBack()
            } label: {
                Text("Start")
            }
            
            Button() {
                theViewModel.killTimer()
            } label: {
                Text("STOP")
            }
        }
    }
}

struct SoundGameView_Preview: PreviewProvider {
    static var previews: some View {
        let theViewModel = N_Back_SwiftUIVM()
        SoundGameView().environmentObject(theViewModel)
    }
}

