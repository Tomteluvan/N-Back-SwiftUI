//
//  GoToButton.swift
//  N-Back-SwiftUI
//
//  Created by Mikael Broström on 2023-11-15.
//

import SwiftUI

struct GoToButton: View { // wow bad name but it does two things.. should be changed
    let labelText: String
    
    init(labelText: String) {
        self.labelText = labelText
    }
    
    var body: some View {
        HStack {
            Text(labelText)
        }
        .padding()
        
        .foregroundColor(Color.white)
        .background(Color.blue)
        .cornerRadius(40)
        
    }
}

#Preview {
    GoToButton(labelText: "GoToButton")
}
