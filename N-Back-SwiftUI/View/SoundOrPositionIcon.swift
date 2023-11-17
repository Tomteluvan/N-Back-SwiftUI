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
        Button(action: {
            start = true
            withAnimation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2)) {
                
                start = false
            }
        }) {
            ZStack {
                VStack {
                    if(image == 1) {
                        Image(systemName: "square.fill")
                            .font(Font.system(size: 100))
                            .padding()
                            .offset(x: start ? 30 : 0)
                            .background(blueBackground)
                            .foregroundColor(Color.blue)
                        Text("Position")
                            .foregroundStyle(.black)
                    } else if image == 2 {
                        Image(systemName: "checkmark.circle.fill")
                            .font(Font.system(size: 100))
                            .padding()
                            .offset(x: start ? 30 : 0)
                            .frame(width: .infinity, height: .infinity)
                            .background(greenBackground)
                            .foregroundColor(Color.green)
                        Text("Correct!")
                            .foregroundStyle(.black)
                    } else if image == 3 {
                        Image(systemName: "music.note")
                            .font(Font.system(size: 50))
                            .padding()
                            .offset(x: start ? 30 : 0)
                            .background(blueBackground)
                            .foregroundColor(Color.blue)
                        Text("Sound")
                            .foregroundStyle(.black)
                    } else {
                        Image(systemName: "xmark.circle.fill")
                            .font(Font.system(size: 50))
                            .padding()
                            .offset(x: start ? 30 : 0)
                            .background(redBackground)
                            .foregroundColor(Color.red)
                        Text("Wrong!")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    SoundOrPositionIcon(image: 2)
}
