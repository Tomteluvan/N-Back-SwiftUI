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
        VStack{
            if(active == 0) {
                Rectangle()
                    .fill(Color.gray)
                    .cornerRadius(10)
            } else if(active == 1) {
                Rectangle()
                    .fill(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding(1)
    }
}

struct RectangleIcon_Preview: PreviewProvider {
    static var previews: some View {
        let theViewModel = N_Back_SwiftUIVM()
        RectangleIcon(active: 1, id: 1).environmentObject(theViewModel)
    }
}
