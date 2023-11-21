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
            ForEach(0..<theViewModel.gridSize) { rowIndex in
                HStack {
                    ForEach(0..<theViewModel.gridSize) { columnIndex in
                        let index = rowIndex * theViewModel.gridSize + columnIndex
                        let aRectangle = theViewModel.rectangles[index]
                        RectangleIcon(active: aRectangle.active, id: aRectangle.id)
                    }
                }
            }
        }
    }
}

struct GridView_Preview: PreviewProvider {
    static var previews: some View {
        let theViewModel = N_Back_SwiftUIVM()
        GridView()
            .environmentObject(theViewModel)
    }
}
