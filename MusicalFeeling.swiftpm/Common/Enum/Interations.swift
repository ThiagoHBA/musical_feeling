//
//  SwiftUIView.swift
//  
//
//  Created by Thiago Henrique on 19/04/22.
//

import SwiftUI

enum Interations : Int {
    case first = 1
    case second = 2
    case third = 3
    case fourth = 4
    case fifth = 5
    case sexth = 6
    
    var interationArray : [UserInterationModel] {
        switch self {
        case .first:
            return [
                UserInterationModel(
                    text: "Maybe it's obvious how much the music can express feelings, Right?",
                    screenPosition: .center,
                    duration: 3,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "But, do you know how this can and it's explored by musicians?",
                    screenPosition: .center,
                    duration: 2,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "Drag the musical note to guitar chords and click play",
                    screenPosition: .bottom,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "This is a Do major chord, composed by the notes C E G",
                    screenPosition: .top,
                    duration: 2,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "Major chords usually express happiness and joy feelings",
                    screenPosition: .top,
                    duration: 3,
                    disablePlayButton: true,
                    disableSpeedControl: true
                )
            ]
        case .second:
            return [
                UserInterationModel(
                    text: "Now let's try something new",
                    screenPosition: .center,
                    duration: 3,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "Drag the musical note to guitar chords and click play",
                    screenPosition: .bottom,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "That sound that you hear is also a Do chord, but, now, minor",
                    screenPosition: .top,
                    duration: 2,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "You can notice that this chord brings with it a sadder and melancholic feeling?",
                    screenPosition: .top,
                    duration: 3,
                    disablePlayButton: true,
                    disableSpeedControl: true
                )
                
            ]
        case .third:
            return [
                UserInterationModel(
                    text: "From one chord to another we modify only one note, amazing, right?",
                    screenPosition: .center,
                    duration: 3,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "What would happen if we change the speed that this chord is played?",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "Maybe now it’s not so sad",
                    screenPosition: .top,
                    duration: 2,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "Changes in speed or intensity that the note is being played is linked to something called Musical Feeling",
                    screenPosition: .top,
                    duration: 4,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),

                UserInterationModel(
                    text: "Is common to see musicians using changes like that to express different sentiments and let they performance more dynamic.",
                    screenPosition: .top,
                    duration: 5,
                    disablePlayButton: true,
                    disableSpeedControl: true
                )
            ]
        case .fourth:
            return [
                UserInterationModel(
                    text: "Let’s try something new again",
                    screenPosition: .center,
                    duration: 3,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "Drag the musical note to guitar chords and click play",
                    screenPosition: .bottom,
                    disableSpeedControl: false
                ),
                UserInterationModel(
                    text: "Can you feel the tension? This is an augmented Do chord.",
                    screenPosition: .top,
                    duration: 2,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "Augmented chords are famous for being used in sounds that represent something strange and obscure.",
                    screenPosition: .top,
                    duration: 3,
                    disablePlayButton: true,
                    disableSpeedControl: true
                )
            ]
        case .fifth:
            return [
                UserInterationModel(
                    text: "This feelings and sensations are approached by an area calling Functional Harmony",
                    screenPosition: .center,
                    duration: 2,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "Basically almost everything that we hear about music is relacionated with that",
                    screenPosition: .center,
                    duration: 2,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "When you watch an advertisement, it is common to use more Major Chords, in hopes of bringing feelings of happiness to the viewer",
                    screenPosition: .bottom,
                    duration: 5,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "In a suspense or horror movie, for example, the use of Augmented Chords are common, they cause tension, exactly what the director expects that the watcher feel",
                    screenPosition: .top,
                    duration: 5,
                    disablePlayButton: true,
                    disableSpeedControl: true
                )
            ]
        case .sexth:
            return [
                UserInterationModel(
                    text: "Music is that beautiful thing that makes we feel in a several different ways",
                    screenPosition: .center,
                    duration: 2,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "Can be with a head phone, speaker, actively participating in her creation or just appreciating her. She has the power to change lifes and express emotions",
                    screenPosition: .bottom,
                    duration: 5,
                    disablePlayButton: true,
                    disableSpeedControl: true
                ),
                UserInterationModel(
                    text: "But what about you, what feelings do you want to let the music overflow?",
                    screenPosition: .top,
                    duration: 2,
                    disablePlayButton: true,
                    disableSpeedControl: true
                )
            ]
        }
    }
}
