//
//  SoundOrPositionIcon.swift
//  N-Back-SwiftUI
//
//  Created by Mikael Broström on 2023-11-16.
//

import SwiftUI

struct SoundOrPositionIcon: View {
    @State private var start: Bool = false
    let image: Int
    private let blueBackground : Color = Color(red: 134/255, green: 185/255, blue: 237/255)
    private let greenBackground : Color = Color(red: 50/255, green: 255/255, blue: 50/255)
    private let redBackground : Color = Color(red: 255/255, green: 125/255, blue: 125/255)
    
    var body: some View {
        ZStack {
            VStack {
                if(image == 1) {
                    Image(systemName: "square.fill")
                        .font(Font.system(size: 50))
                        .padding()
                        .offset(x: start ? 30 : 0)
                        .foregroundColor(Color.blue)
                } else if image == 2 {
                    Image(systemName: "music.note")
                        .font(Font.system(size: 50))
                        .padding()
                        .offset(x: start ? 30 : 0)
                        .foregroundColor(Color.blue)
                } else if image == 3 {
                    Image(systemName: "checkmark.circle.fill")
                        .font(Font.system(size: 50))
                        .padding()
                        .offset(x: start ? 30 : 0)
                        .foregroundColor(greenBackground)
                } else {
                    Image(systemName: "xmark.circle.fill")
                        .font(Font.system(size: 50))
                        .padding()
                        .offset(x: start ? 30 : 0)
                        .foregroundColor(Color.red)
                }
            }
        }
    }
}

#Preview {
    SoundOrPositionIcon(image: 3)
}
