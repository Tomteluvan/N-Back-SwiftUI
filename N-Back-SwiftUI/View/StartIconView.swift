//
//  StartIconView.swift
//  N-Back-SwiftUI
//
//  Created by Mikael Broström on 2023-11-18.
//

import SwiftUI

struct StartIconView: View {
    var body: some View {
        HStack {
            Image(systemName: "play.fill")
                .imageScale(.large)
        }
        .padding()
       
        .foregroundColor(Color.white)
        .background(Color.blue)
        .cornerRadius(40)
    }
}

#Preview {
    StartIconView()
}
