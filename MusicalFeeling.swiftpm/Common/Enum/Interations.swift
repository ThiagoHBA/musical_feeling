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
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "But, do you know how this can and it's explored by musicians?",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "Drag the musical note to guitar chords",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "This is a Do major chord, composed by the notes C E G",
                    screenPosition: .top
                ),
                UserInterationModel(
                    text: "Major chords usually express happiness and joy feelings",
                    screenPosition: .top
                )
            ]
        case .second:
            return [
                UserInterationModel(
                    text: "Now let's try something new",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "Drag the musical note to guitar chords",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "That sound that you hear is also a Do chord, but, now, minor",
                    screenPosition: .top
                ),
                UserInterationModel(
                    text: "You can notice that this chord brings with it a sadder and melancholic feeling?",
                    screenPosition: .top
                )
                
            ]
        case .third:
            return [
                UserInterationModel(
                    text: "From one chord to another we modify only one note, amazing, right?",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "What would happen if we change the speed that this chord is played?",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "Maybe now it’s not so sad",
                    screenPosition: .top
                ),
                UserInterationModel(
                    text: "Changes in speed or intensity that the note is being played is linked to something called Musical Feeling",
                    screenPosition: .top
                ),

                UserInterationModel(
                    text: "Is common to see musicians using changes like that to express different sentiments and let they performance more dynamic.",
                    screenPosition: .top
                )
            ]
        case .fourth:
            return [
                UserInterationModel(
                    text: "Let’s try something new again",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "Drag the musical note to guitar chords",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "Can you feel the tension? This is an augmented Do chord.",
                    screenPosition: .top
                ),
                UserInterationModel(
                    text: "Augmented chords are famous for being used in sounds that represent something strange and obscure.",
                    screenPosition: .top
                )
            ]
        case .fifth:
            return [
                UserInterationModel(
                    text: "This feelings and sensations are approached by an area calling Functional Harmony",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "Basically almost everything that we hear about music is relacionated with that",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "When you watch an advertisement, it is common to use more Major Chords, in hopes of bringing feelings of happiness to the viewer",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "In a suspense or horror movie, for example, the use of Augmented Chords are common, they cause tension, exactly what the director expects that the watcher feel",
                    screenPosition: .top
                )
            ]
        case .sexth:
            return [
                UserInterationModel(
                    text: "Music is that beautiful thing that makes we feel in a several different ways",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "Can be with a head phone, speaker, actively participating in her creation or just appreciating her. She has the power to change lifes and express emotions",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "But what about you, what feelings do you want to let the music overflow?",
                    screenPosition: .top
                )
            ]
        }
    }
}
