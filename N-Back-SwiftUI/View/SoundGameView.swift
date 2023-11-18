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
        VStack { //uhm do i need this class
            
        }
    }
}

struct SoundGameView_Preview: PreviewProvider {
    static var previews: some View {
        let theViewModel = N_Back_SwiftUIVM()
        SoundGameView().environmentObject(theViewModel)
    }
}

