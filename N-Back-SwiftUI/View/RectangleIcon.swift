//
//  RectangleIcon.swift
//  N-Back-SwiftUI
//
//  Created by Mikael Broström on 2023-11-15.
//

import SwiftUI

struct RectangleIcon: View {
    @EnvironmentObject var theViewModel : N_Back_SwiftUIVM
    
    var active : Int
    var id : Int
    
    var body: some View {
        if(active == 0) {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 75, height: 75)
                .cornerRadius(10)
        } else if(active == 1) {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 75, height: 75)
                .cornerRadius(10)
        }
    }
}

struct RectangleIcon_Preview: PreviewProvider {
    static var previews: some View {
        let theViewModel = N_Back_SwiftUIVM()
        RectangleIcon(active: 1, id: 1).environmentObject(theViewModel)
    }
}
