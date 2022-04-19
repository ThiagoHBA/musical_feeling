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
    
    func updateInteration(actualInteration : inout (position: Int, counter: Int)) {
        if actualInteration.position > 0 {
            if actualInteration.counter < 2 {
                actualInteration.counter += 1
            }
            else {
                actualInteration.position += 1
                actualInteration.counter = 0
            }
        }
        else{
            actualInteration.position += 1
        }
    }
    
    func playMutipleSounds(soundFileNames: [String]) {
        for soundName in soundFileNames {
            playSound(soundName: soundName)
        }
    }
    
    func playMutipleSounds(soundFileNames: [String], withDelay: Int) {
        DispatchQueue.global(qos: .default).async {
            for soundName in soundFileNames {
                  DispatchQueue.main.async {
                      self.playSound(soundName: soundName)
                  }
                usleep(useconds_t(1000000 / withDelay))
              }
         }
    }
}
