//
//  N_Back_SwiftUIVM.swift
//  N-Back-SwiftUI
//
//  Created by Jonas Willén on 2023-09-19.
//

import Foundation
import AVFoundation

class N_Back_SwiftUIVM : ObservableObject  {
    let synthesizer = AVSpeechSynthesizer()
    var theModel : N_BackSwiftUIModel
    var rectangleTimer: Timer?
    var soundtimer: Timer?
    
    @Published var highScore : Int
    @Published var currentScore : Int
    @Published var gridSize : Int
    @Published var nBackLevel : Int
    @Published var rectangles: [aRectangle] = []
    @Published var currentIndex : Int
    @Published var canGuessPosition: Bool
    @Published var canGuessSound: Bool
    @Published var timeBetween: Double
    @Published var numberOfEvents: Int
    
    init(){
        theModel = N_BackSwiftUIModel(count: 0, gridSize: 3, nBackLevel: 1, highScore: 0, numberOfEvents: 25)
        currentScore = theModel.getCount()
        highScore = theModel.getHighScore()
        gridSize = theModel.getGridSize()
        nBackLevel = theModel.getNBackLevel()
        numberOfEvents = theModel.getNumberOfEvents()
        timeBetween = 2
        currentIndex = 0
        canGuessPosition = false
        canGuessSound = false
        rectangles = initRectangles()
    }
    
    
    func newHighScoreValue(){
        theModel.updateHighScore()
        highScore = theModel.getHighScore()
    }
    
    func addScore(){
        theModel.addScore()
        currentScore = theModel.getCount()
    }
    
    func getCurrentScore(){
        currentScore = theModel.getCount()
    }
    
    func updateNumberOfEvents(){
        theModel.updateNumberOfEvents()
        numberOfEvents = theModel.getNumberOfEvents()
    }
    
    func updateTimeBetween(){
        if timeBetween == 4 {
            timeBetween = 2
        } else {
            timeBetween += 1
        }
    }
    
    func getRealTimeBetween() -> Double{
        return timeBetween - 1
    }
    
    func getGridSize() -> Int {
        return gridSize
    }
    
    func changeGridSize(){
        theModel.changeGridSize()
        gridSize = theModel.getGridSize()
        rectangles = initRectangles()
    }
    
    func getNBacklevel() -> Int{
        return nBackLevel
    }
    
    func changeNBackLevel(){
        theModel.changeNBackLevel()
        nBackLevel = theModel.getNBackLevel()
    }
    
    
    func soundClick(){
        let theString: String = theModel.getString()
        speech(aString: theString)
    }
    
    func imageClick(){
        theModel.resetNback()
    }
    
    func getRectangleIndex(with id: Int) -> Int? {
        return rectangles.firstIndex(where: { $0.id == id })
    }
    
    func rectangleToActive(id: Int) {
        if let index = getRectangleIndex(with: id){
            rectangles[index].active = 1
        }
    }

    func rectangleNotActive(id: Int){
        if let index = getRectangleIndex(with: id){
            rectangles[index].active = 0
        }
    }
    
    func getNext(index: Int) -> Int{ //i think unused...
        print("\(theModel.getNBackValue(id: index))")
        return theModel.getNBackValue(id: index)
    }
    
    func initRectangles() -> [aRectangle] {
        let gridSize = theModel.getGridSize()
        let rectangleAmount = gridSize*gridSize
        
        var rectangles: [aRectangle] = []
        
        for index in 0..<rectangleAmount {
              let rectangle = aRectangle(id: index+1, active: 0)
              rectangles.append(rectangle)
          }
          
        return rectangles
    }
    
    func tryPosition(){
        print("nbacklevel is: \(nBackLevel)")
        let nBackArray = theModel.getNBackArray()
        if canGuessPosition == true {
            if self.currentIndex - nBackLevel > 0 && nBackArray[self.currentIndex - nBackLevel] == nBackArray[self.currentIndex] { //crashes at the end!
                print("correct guess")
                theModel.addScore()
                getCurrentScore()
                canGuessPosition = false
            } else {
                print("wrong guess")
                canGuessPosition = false
            }
        } else {
            print("already guessed")
        }

    }
    
    func trySound(){
        let nBackSoundArray = theModel.getNBackSoundArray()
        if canGuessSound == true {
            if self.currentIndex - nBackLevel > 0 && nBackSoundArray[self.currentIndex - nBackLevel] == nBackSoundArray[self.currentIndex] {
                print("correct sound guess")
                theModel.addScore()
                getCurrentScore()
                canGuessSound = false
            } else {
                print("wrong sound guess")
                canGuessSound = false
            }
        } else {
            print("already guessed sound")
        }
    }
    
    func shakePosition(){
        
    }
    
    func startAnimation() {
        theModel.resetNback()
        theModel.resetScore()
        getCurrentScore()
        let nBackArray = theModel.getNBackArray()
        currentIndex = 0
        
        rectangleTimer?.invalidate() // need to create instance of timer to be able to invalidate it if its running to reset
        
        rectangleTimer = Timer.scheduledTimer(withTimeInterval: timeBetween, repeats: true) { timer in
            if self.currentIndex < nBackArray.count {
                let value = nBackArray[self.currentIndex]
                self.rectangleToActive(id: value)
                self.canGuessPosition = true
                
                // Schedule the rectangleToNotActive after another second
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.rectangleNotActive(id: value)
                    self.currentIndex += 1
                }
                
            } else {
                self.newHighScoreValue()
                timer.invalidate() // Stop the timer when all values are processed
            }
        }
    }
    
    func startSoundPlayBack() {
        theModel.resetSoundNBack()
        theModel.resetScore()
        getCurrentScore()
        let nBackArray = theModel.getNBackSoundArray()
        currentIndex = 0
        
        soundtimer?.invalidate()
        
        soundtimer = Timer.scheduledTimer(withTimeInterval: timeBetween, repeats: true) { timer in
            if self.currentIndex < nBackArray.count {
                let value = nBackArray[self.currentIndex]
                self.speech(aString: value)
                print("Sound value: \(value)")
                self.canGuessSound = true
                
                // Schedule the rectangleToNotActive after another second
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.currentIndex += 1
                }
                
            } else {
                self.newHighScoreValue()
                timer.invalidate() // Stop the timer when all values are processed
            }
        }
    }
    
    func startBothGames() {
        self.startAnimation()
        self.startSoundPlayBack()
    }
    
    func killTimer() {
        soundtimer?.invalidate()
    }
    
    
    struct aRectangle : Hashable, Codable, Identifiable {
        var id: Int
        var active: Int
    }
    
    
    // IO handling
    
    func speech(aString: String){
        let voiceIdentifier = "com.apple.speech.synthesis.voice.Fred"
        let soundVoice = AVSpeechUtterance(string: aString)
        soundVoice.voice = AVSpeechSynthesisVoice(identifier: voiceIdentifier)
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate )
        synthesizer.speak(soundVoice)
    }
    
}






