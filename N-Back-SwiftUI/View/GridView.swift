//
//  GridView.swift
//  N-Back-SwiftUI
//
//  Created by Mikael Broström on 2023-11-15.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject var theViewModel : N_Back_SwiftUIVM
    
    var body: some View {
        VStack {
            Text("current score: \(theViewModel.currentScore)")
            Text("current highscore: \(theViewModel.highScore)")
            Text("Event: \(theViewModel.currentIndex) / \(theViewModel.numberOfEvents)")
            ForEach(0..<theViewModel.gridSize) { rowIndex in
                HStack {
                    ForEach(0..<theViewModel.gridSize) { columnIndex in
                        let index = rowIndex * theViewModel.gridSize + columnIndex
                        let aRectangle = theViewModel.rectangles[index]
                        RectangleIcon(active: aRectangle.active, id: aRectangle.id)
                    }
                }
            }
            Button(){
                theViewModel.tryPosition()
            } label: {
                Text("YES IMAGE CORRECT PRESS PRESS")
            }
            Button(action: {
                theViewModel.startAnimation()
            }) {
                Text("Start")
            }
        }
    }
    
}

struct GridView_Preview: PreviewProvider {
    static var previews: some View {
        let theViewModel = N_Back_SwiftUIVM()
        GridView().environmentObject(theViewModel)
    }
}
