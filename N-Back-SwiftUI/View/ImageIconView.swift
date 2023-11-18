//
//  ImageIconView.swift
//  N-Back-SwiftUI
//
//  Created by Jonas Willén on 2023-10-03.
//

import SwiftUI

struct ImageIconView: View {
    var body: some View {
        HStack {
            Image(systemName: "square.fill")
                .imageScale(.large)
            Text("Position")
        }
        .padding()
       
        .foregroundColor(Color.white)
        .background(Color.blue)
        .cornerRadius(40)
        
    }
}

struct ImageIconView_Previews: PreviewProvider {
    static var previews: some View {
        ImageIconView()
    }
}
