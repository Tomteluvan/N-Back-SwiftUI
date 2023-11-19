//
//  GameView.swift
//  N-Back-SwiftUI
//
//  Created by Mikael Broström on 2023-11-15.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var theViewModel : N_Back_SwiftUIVM
    let gameType: String
    var body: some View {
        ZStack {
            Color(red: 134/255, green: 185/255, blue: 237/255).edgesIgnoringSafeArea(.all)
            if !UIDevice.current.orientation.isLandscape {
                VStack {
                    portraitView()
                }
            } else {
                VStack {
                    landscapeView()
                }
            }
        }
        .onAppear {
            // Subscribe to orientation changes
            NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                // Redraw the view when the orientation changes
                theViewModel.objectWillChange.send()
            }
        }
    }
    
    func portraitView() -> some View {
        VStack {
            if gameType == "Position" {
                GameInfoView(soundOrPositionOrBoth: "Position")
                GridView()
            } else if gameType == "Sound" {
                GameInfoView(soundOrPositionOrBoth: "Sound")
                SoundGameView()
            } else {
                GameInfoView(soundOrPositionOrBoth: "Position") // its the same index so should not matter...
                SoundAndPositionView()
            }
            Spacer()
            Button() {
                if gameType == "Position" {
                    theViewModel.startAnimation()
                } else if gameType == "Sound" {
                    theViewModel.startSoundPlayBack()
                } else {
                    theViewModel.startBothGames()
                }
                
            } label: {
                StartIconView()
            }
            ActionView()
            Spacer()
        }
        .padding()
    }
    
    func landscapeView() -> some View {
        HStack {
            if gameType == "Position" {
                GameInfoView(soundOrPositionOrBoth: "Position")
                GridView()
            } else if gameType == "Sound" {
                GameInfoView(soundOrPositionOrBoth: "Sound")
                SoundGameView()
            } else {
                GameInfoView(soundOrPositionOrBoth: "Position") // its the same index so should not matter...
                SoundAndPositionView()
            }
            VStack {
                Spacer()
                Button() {
                    if gameType == "Position" {
                        theViewModel.startAnimation()
                    } else if gameType == "Sound" {
                        theViewModel.startSoundPlayBack()
                    } else {
                        theViewModel.startBothGames()
                    }
                    
                } label: {
                    StartIconView()
                }
                ActionView()
                Spacer()
            }
            .padding()
        }
        
    }
}

struct GameView_Preview : PreviewProvider {
    static var previews: some View {
        let theViewModel = N_Back_SwiftUIVM()
        GameView(gameType: "Position").environmentObject(theViewModel)
    }
}
