//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 12/04/22.
//

import SwiftUI
import AVFoundation

class MusicPlayerController {
    var players = [URL:AVAudioPlayer]()
    var duplicatePlayers = [AVAudioPlayer]()
    
    var rectanglePosition = CGPoint (
        x: UIScreen.main.bounds.size.width * 0.5,
        y: UIScreen.main.bounds.size.height * 0.5
    )
    
    var rectangleFrame : (CGFloat, CGFloat) = (
        width: UIScreen.main.bounds.width * 0.9,
        height: 300
    )
    
    func musicalRectangleContainsItem(itemPosition: CGPoint) -> Bool {
        func checkYAxis() -> Bool {
            let initialRectanglePosition = self.rectanglePosition.y - (self.rectangleFrame.1/2)
            let finalRectanglePosition = self.rectanglePosition.y + (self.rectangleFrame.1/2)
            
            return initialRectanglePosition < itemPosition.y && finalRectanglePosition > itemPosition.y
        }
        
        func checkXAxis() -> Bool {
            return false
        }
        
        return checkXAxis() || checkYAxis()
    }
    
    
    func playSound(soundName: String) {
        guard let soundUrl = Bundle.main.url(forResource: soundName, withExtension: ".aif")
        else {
            return
        }
        
        if let player = self.players[soundUrl] {
            if !player.isPlaying {
                player.prepareToPlay()
                player.play()
                return
            }
            createADuplicatedPlayer()
            return
        }
        
        createANewPlayer()
        
        func createANewPlayer() {
            do{
                let player = try AVAudioPlayer(contentsOf: soundUrl)
                players[soundUrl] = player
                player.prepareToPlay()
                player.play()
            } catch {
                print("Could not play sound file!")
            }
        }
        
        func createADuplicatedPlayer() {
            let newPlayer = try! AVAudioPlayer(contentsOf: soundUrl)
            duplicatePlayers.append(newPlayer)
            newPlayer.prepareToPlay()
            newPlayer.play()
        }
        
    }
    
    func playMutipleSounds(soundFileNames: [String]) {
        for soundName in soundFileNames {
            playSound(soundName: soundName)
        }
    }
}
