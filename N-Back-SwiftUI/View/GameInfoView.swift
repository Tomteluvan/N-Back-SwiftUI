//
//  ScoreAndEventInfoView.swift
//  N-Back-SwiftUI
//
//  Created by Mikael Broström on 2023-11-18.
//

import SwiftUI

struct GameInfoView: View {
    @EnvironmentObject var theViewModel : N_Back_SwiftUIVM
    let soundOrPositionOrBoth : String
    var body: some View {
        VStack {
            HStack{
                Spacer()
                VStack{
                    Text("Score")
                    Text("\(theViewModel.currentScore)")
                }
                Spacer()
                VStack{
                    Text("Highscore")
                    Text("\(theViewModel.highScore)")
                }
                Spacer()
            }
            Text("N = \(theViewModel.nBackLevel)")
                .padding()
            if soundOrPositionOrBoth == "Position" {
                Text("Event \(theViewModel.positionIndex+1) / \(theViewModel.numberOfEvents)")
            } else if soundOrPositionOrBoth == "Sound" {
                Text("Event \(theViewModel.soundIndex+1) / \(theViewModel.numberOfEvents)")
            }
        }
        .padding()
    }
}

struct GameInfoView_Preview: PreviewProvider {
    static var previews: some View {
        let theViewModel = N_Back_SwiftUIVM()
        GameInfoView(soundOrPositionOrBoth: "Position").environmentObject(theViewModel)
    }
}

