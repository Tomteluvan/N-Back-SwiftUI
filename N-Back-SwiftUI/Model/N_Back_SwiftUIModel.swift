//
//  N_Back_SwiftUIModel.swift
//  N-Back-SwiftUI
//
//  Created by Jonas Willén on 2023-09-19.
//

import Foundation

struct N_BackSwiftUIModel {
    private var count : Int
    private var gridSize : Int
    private var nBackLevel : Int
    private var numberOfEvents: Int
    private var highScore : Int
    private var nBackArray : [Int] = []
    private var nBackSoundArray: [String] = []
    
    init(count: Int, gridSize : Int, nBackLevel : Int, highScore: Int, numberOfEvents: Int) {
        self.count = count
        self.gridSize = gridSize
        self.nBackLevel = nBackLevel
        self.highScore = highScore
        self.numberOfEvents = numberOfEvents
    }
    
    func getString() -> String{
        return "Hello World"
    }
    
    func getHighScore() -> Int{
        return highScore
    }
    
    func getCount() -> Int{
        return count
    }
    
    mutating func updateHighScore(){
        if(getHighScore() < getCount()) {
            highScore = getCount()
        }
    }
    
    func getNumberOfEvents() -> Int{
        return numberOfEvents
    }
    
    mutating func updateNumberOfEvents(){
        if(numberOfEvents >= 45){
            numberOfEvents = 25
        } else {
            numberOfEvents += 5
        }
    }
    
    mutating func addScore(){
        count += 1
    }
    
    mutating func resetScore(){
        count = 0
    }
    
    func getNBackLevel() -> Int{
        return nBackLevel
    }
    
    mutating func changeNBackLevel(){
        if(nBackLevel == 5) {
            nBackLevel = 1
        } else {
            nBackLevel += 1
        }
    }
    
    func getGridSize() -> Int{
        return gridSize
    }
    
    mutating func changeGridSize(){
        if(gridSize == 5) {
            gridSize = 3
        } else {
            gridSize += 1
        }
    }
    
    func getNBackValue(id: Int) -> Int {
        return nBackArray[id]
    }
    
    func getNBackArray() -> [Int] {
        return nBackArray
    }
    
    func getNBackSoundArray() -> [String] {
        return nBackSoundArray
    }
    
    mutating func resetSoundNBack(){
        nBackSoundArray.removeAll()
        
        let amountOfNumbers = Int32(gridSize*gridSize) //amount of tiles and thus combinations, maybe should save as globally accessable?
        let nBack = Int32(nBackLevel)
        let events = Int32(numberOfEvents)
        let Nback = create(events, amountOfNumbers, 20, nBack)
        count = 0 // ughhhh highscore idk how to do it
        
        for i in 0...events-1 {
            let test:Int32 = Int32(i)
            let currentNumber = Int(getIndexOf(Nback, test))
            nBackSoundArray.append(WordData.words[currentNumber])
            print("Value sound: \(getIndexOf(Nback, test))")
        }
    }
    
    mutating func resetNback(){
        nBackArray.removeAll() // null the array if game is to reset
        
        let amountOfNumbers = Int32(gridSize*gridSize) //amount of tiles and thus combinations
        let nBack = Int32(nBackLevel)
        let events = Int32(numberOfEvents)
        let Nback = create(events, amountOfNumbers, 20, nBack)
        count = 0 // i think i need to reset this here
        
        
        for i in 0...events-1 {
            let test:Int32 = Int32(i)
            let currentNumber = Int(getIndexOf(Nback, test))
            nBackArray.append(currentNumber)
            print("aValue rectangle: \(getIndexOf(Nback, test))")
        }
        
    }
   
}
