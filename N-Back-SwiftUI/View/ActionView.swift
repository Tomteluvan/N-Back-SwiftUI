//
//  ActionIconView.swift
//  N-Back-SwiftUI
//
//  Created by Jonas Willén on 2023-10-03.
//

import SwiftUI

struct ActionView: View {
    @EnvironmentObject var theViewModel : N_Back_SwiftUIVM
    var body: some View {
        
        VStack(alignment: .center) {
            Spacer()
            HStack(spacing: 30){
                Button {
                    theViewModel.soundClick()
                } label: {
                    SoundIconView()
                }
                Button {
                    theViewModel.imageClick()
                } label: {
                    ImageIconView()
                }
            }
            
        }
    }
}

struct ActionIconView_Previews: PreviewProvider {
    static var previews: some View {
        ActionView()
            .environmentObject(N_Back_SwiftUIVM())
    }
}
