import SwiftUI
import AVFoundation

class MusicPlayerController : ObservableObject {
    @Published var musicSpeed : Int
    @Published var notesInsideMusicalDiagram : [MusicalNote] = []
    @Published var actualInteractionCounter : Int = 0
    @Published var notes : [MusicalNote]
    
    let nextInteraction : Interations?
    
    init(notes: [MusicalNote], nextInteraction: Interations? = nil, musicSpeed : Int = 2) {
        self.notes = notes
        self.nextInteraction = nextInteraction
        self.musicSpeed = musicSpeed
    }
    
    private var players = [URL:AVAudioPlayer]()
    private var duplicatePlayers = [AVAudioPlayer]()
    
    var rectanglePosition: CGPoint {
            return CGPoint(
                x: UIScreen.main.bounds.size.width * 0.5,
                y: UIScreen.main.bounds.size.height * 0.5
            )
    }
    
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
    
    func updateInteration(interactionArray: [UserInterationModel], mainController : MainViewController) {
        
        if self.actualInteractionCounter < interactionArray.count - 1 {
            self.actualInteractionCounter += 1
            return
        }
        
        self.actualInteractionCounter = 0
        
        if nextInteraction != nil {
            mainController.currentInteraction = self.nextInteraction!
        }
        
    }
    
    private func playMutipleSounds(soundFileNames: [String]) {
        for soundName in soundFileNames {
            playSound(soundName: soundName)
        }
    }
    
    private func playMutipleSounds(soundFileNames: [String], withDelay: Int) {
        DispatchQueue.global(qos: .default).async {
            for soundName in soundFileNames {
                  DispatchQueue.main.async {
                      self.playSound(soundName: soundName)
                  }
                
                usleep(useconds_t(1000000 / withDelay))
              }
         }
    }
    
    func playDigramNotes() {
        var noteFileNames : [String] = []
        
        for musicalNote in self.notesInsideMusicalDiagram {
            noteFileNames.append(musicalNote.note.rawValue)
        }
        
        if !noteFileNames.isEmpty {
            self.playMutipleSounds (
                soundFileNames: noteFileNames,
                withDelay: self.musicSpeed
            )
        }
    }
    
    func changeDiagramNotes(newNotes: [MusicalNote]) {
        let oldNotes = self.notesInsideMusicalDiagram
        
        self.notesInsideMusicalDiagram.removeAll()
        
        for i in 0...newNotes.count - 1 {
            var note = newNotes[i]
            
            if !oldNotes.isEmpty {
                note.position.x = oldNotes.first!.position.x - (CGFloat(i) * (UIScreen.main.bounds.width * 0.05))
                note.position.y = oldNotes.first!.position.y + CGFloat((i * 30))
                note.toBePlaying = oldNotes.first!.toBePlaying
            }
            
            self.notesInsideMusicalDiagram.append(note)
        }
        
    }

}
