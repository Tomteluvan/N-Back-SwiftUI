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
            ZStack {
                Color(red: 134/255, green: 185/255, blue: 237/255).edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Click buttons to change values").font(.title).foregroundStyle(Color.white)
                    Text("Highscore: \(theViewModel.highScore)").foregroundStyle(Color.white)
                    Button {
                        theViewModel.changeGridSize()
                    } label : {
                        GoToButton(labelText: "Positions/Sounds amount: \(theViewModel.getGridSize()*theViewModel.getGridSize())")
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
                    HStack {
                        NavigationLink( destination: GameView(gameType: "Position")
                            .onAppear {
                                theViewModel.resetBoth()
                            }) {
                            GoToButton(labelText: "Play Position")
                        }
                        NavigationLink( destination: GameView(gameType: "Both")
                            .onAppear {
                                theViewModel.resetBoth()
                            }) {
                            GoToButton(labelText: "Play Both")
                        }
                        NavigationLink( destination: GameView(gameType: "Sound")
                            .onAppear {
                                theViewModel.resetBoth()
                            }) {
                            GoToButton(labelText: "Play Sound")
                        }
                    }
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
