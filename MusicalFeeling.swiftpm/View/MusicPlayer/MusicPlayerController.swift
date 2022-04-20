import SwiftUI
import AVFoundation

class MusicPlayerController : ObservableObject {
    @Published var musicSpeed = 2
    @Published var notesInsideMusicalDiagram : [MusicalNote] = []
    @Published var actualInteractionCounter : Int = 0
    
    @Published var notes : [MusicalNote]
    let nextInteraction : Interations
    
    init(notes: [MusicalNote], nextInteraction: Interations) {
        self.notes = notes
        self.nextInteraction = nextInteraction
    }
    
    private var players = [URL:AVAudioPlayer]()
    private var duplicatePlayers = [AVAudioPlayer]()
    
    var rectanglePosition = CGPoint (
        x: UIScreen.main.bounds.size.width * 0.5,
        y: UIScreen.main.bounds.size.height * 0.5
    )
    
    var rectangleFrame = (
        width: UIScreen.main.bounds.width * 0.9,
        height: 300.0
    )
    
    func musicalRectangleContainsItem(itemPosition: CGPoint?) -> Bool {
        if itemPosition == nil {return false}
        
        func checkYAxis() -> Bool {
            let initialRectanglePosition = self.rectanglePosition.y - (self.rectangleFrame.height/2)
            let finalRectanglePosition = self.rectanglePosition.y + (self.rectangleFrame.height/4)
            
            return itemPosition!.y > initialRectanglePosition && itemPosition!.y < finalRectanglePosition
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
    
    func updateInteration(interactionArray: [UserInterationModel]) -> Bool {
        if self.actualInteractionCounter < interactionArray.count - 1 {
            self.actualInteractionCounter += 1
            return true
        }
        
        self.actualInteractionCounter = 0
        return false
        
//        if actualInteraction.position > 0 {
//            guard let interation = Interations.init(rawValue: actualInteraction.position) else {return}
//
//            if actualInteraction.counter < interation.interationArray.count - 1 {
//                actualInteraction.counter += 1
//            }
//            else {
//                actualInteraction.position += 1
//                actualInteraction.counter = 0
//            }
//        }
//        else{
//            actualInteraction.position += 1
//        }
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
