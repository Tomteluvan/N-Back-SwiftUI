//
//  HomeScreenView.swift
//  N-Back-SwiftUI
//
//  Created by Mikael Broström on 2023-11-15.
//

import SwiftUI



struct HomeScreenView: View {
    @EnvironmentObject var theViewModel : N_Back_SwiftUIVM
    var body: some View {
        NavigationStack{
            VStack {
                Button {
                    theViewModel.changeGridSize()
                } label : {
                    GoToButton(labelText: "Grid size: \(theViewModel.getGridSize())")
                }
                
                Button {
                    theViewModel.changeNBackLevel()
                } label: {
                    GoToButton(labelText: "N-Back: \(theViewModel.getNBacklevel())")
                }
                
                Button {
                    theViewModel.updateTimeBetween()
                } label: {
                    GoToButton(labelText: "Time between events: \(theViewModel.getRealTimeBetween())s")
                }
                
                Button {
                    theViewModel.updateNumberOfEvents()
                } label: {
                    GoToButton(labelText: "Number of events: \(theViewModel.numberOfEvents)")
                }
                
                NavigationLink( destination: GameView()) {
                    GoToButton(labelText: "Play")
                }
                NavigationLink( destination: SoundGameView()) {
                    GoToButton(labelText: "play but with sound")
                }
            }
        }
    }
}

struct HomeScreenView_Preview: PreviewProvider {
    static var previews: some View {
        let theViewModel = N_Back_SwiftUIVM()
        HomeScreenView().environmentObject(theViewModel)
    }
}
