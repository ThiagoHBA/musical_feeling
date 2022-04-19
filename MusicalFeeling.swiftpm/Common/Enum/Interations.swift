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
    case seventh = 7
    
    var interationArray : [UserInterationModel] {
        switch self {
        case .first:
            return [
                UserInterationModel(
                    text: "Talvez seja óbvio o quanto a música pode expressar sentimentos. Porém você sabe como isso pode e é explorados por musicos?",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "Arraste a nota musical para o tocador de música.",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "Este é um acorde de Dó maior, formado pelas notas: C E G. Acordes maiores costumar expressar felicidade e alegria.",
                    screenPosition: .top
                )
            ]
        case .second:
            return [
                UserInterationModel(
                    text: "Talvez seja óbvio o quanto a música pode expressar sentimentos. Porém você sabe como isso pode e é explorados por musicos?",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "Arraste a nota musical para o tocador de música.",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "Este é um acorde de Dó maior, formado pelas notas: C E G. Acordes maiores costumar expressar felicidade e alegria.",
                    screenPosition: .top
                )
            ]
        case .third:
            return [
                UserInterationModel(
                    text: "Talvez seja óbvio o quanto a música pode expressar sentimentos. Porém você sabe como isso pode e é explorados por musicos?",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "Arraste a nota musical para o tocador de música.",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "Este é um acorde de Dó maior, formado pelas notas: C E G. Acordes maiores costumar expressar felicidade e alegria.",
                    screenPosition: .top
                )
            ]
        case .fourth:
            return [
                UserInterationModel(
                    text: "Talvez seja óbvio o quanto a música pode expressar sentimentos. Porém você sabe como isso pode e é explorados por musicos?",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "Arraste a nota musical para o tocador de música.",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "Este é um acorde de Dó maior, formado pelas notas: C E G. Acordes maiores costumar expressar felicidade e alegria.",
                    screenPosition: .top
                )
            ]
        case .fifth:
            return [
                UserInterationModel(
                    text: "Talvez seja óbvio o quanto a música pode expressar sentimentos. Porém você sabe como isso pode e é explorados por musicos?",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "Arraste a nota musical para o tocador de música.",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "Este é um acorde de Dó maior, formado pelas notas: C E G. Acordes maiores costumar expressar felicidade e alegria.",
                    screenPosition: .top
                )
            ]
        case .sexth:
            return [
                UserInterationModel(
                    text: "Talvez seja óbvio o quanto a música pode expressar sentimentos. Porém você sabe como isso pode e é explorados por musicos?",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "Arraste a nota musical para o tocador de música.",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "Este é um acorde de Dó maior, formado pelas notas: C E G. Acordes maiores costumar expressar felicidade e alegria.",
                    screenPosition: .top
                )
            ]
        case .seventh:
            return [
                UserInterationModel(
                    text: "Talvez seja óbvio o quanto a música pode expressar sentimentos. Porém você sabe como isso pode e é explorados por musicos?",
                    screenPosition: .center
                ),
                UserInterationModel(
                    text: "Arraste a nota musical para o tocador de música.",
                    screenPosition: .bottom
                ),
                UserInterationModel(
                    text: "Este é um acorde de Dó maior, formado pelas notas: C E G. Acordes maiores costumar expressar felicidade e alegria.",
                    screenPosition: .top
                )
            ]
        }
    }
}
