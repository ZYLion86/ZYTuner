//
//  ZYHUD.swift
//  ZYTuner
//
//  Created by joox on 2023/2/17.
//

import SwiftUI
import MicrophonePitchDetector

struct ZYHUD: View {
    
    @ObservedObject var detector: MicrophonePitchDetector
    @Binding var selectedNote: String
    @Binding var selectedOctave: String
    
    var pitch: Frequency {
        Frequency(floatLiteral: Double(detector.pitch))
    }
    
    var distance: Frequency.MusicalDistance {
        match.distance
    }
    
    var match: ScaleNote.Match {
        ScaleNote.closestNote(to: pitch)
    }
    
    var note: String {
        String(match.note.names.first?.prefix(1) ?? "")
    }
    
    var octave: String {
        String(match.octave)
    }

    var frequency: String {
        match.frequency.localizedString()
    }
    
    var isPerceptible: Bool {
        match.distance.isPerceptible
    }
    
    var textOffset: CGFloat {
        octave.textWidth(fontSize: 14) / 2.0 + 2
    }
    
    var body: some View {
        ZStack {
            HStack {
                Divider().frame(width: 1).overlay {
                    LinearGradient(
                        colors: [Color("lemon-yellow").opacity(0.0), Color("lemon-yellow"), Color("lemon-yellow").opacity(0.0)],
                        startPoint: .init(x: 0, y: 0),
                        endPoint: .init(x: 0, y: 1)
                    )
                }
            }
            HStack {
                Circle().frame(width: 10).foregroundColor(matchColor())
            }
            VStack {
                HStack(alignment: .firstTextBaseline, spacing: 2) {
                    Text(selectedNote.count > 0 ? selectedNote : note).font(.system(size: 52)).foregroundColor(itemColor()).offset(x: textOffset)
                    Text(selectedOctave.count > 0 ? selectedOctave : octave).font(.system(size: 14)).foregroundColor(itemColor()).offset(x: textOffset)
                }
                Spacer()
                VStack(alignment: .center) {
                    Spacer().frame(height: 30)
                    Image("polygon.fill")
                    Text("\(Int(distance.cents))").font(.system(size: 24)).foregroundColor(.white)
                }
                .offset(x: offsetX(UIScreen.width - 52))
                Spacer()
                HStack {
                    Text(frequency).font(.system(size: 14)).foregroundColor(.white)
                }
            }
            .animation(.easeInOut, value: distance.cents)
        }
        .frame(height: 240)
    }
    
    private func offsetX(_ width: CGFloat) -> CGFloat {
        (width / 2) * CGFloat(distance.cents / 200)
    }
    
    private func itemColor() -> Color {
        if note == selectedNote, octave == selectedOctave {
            return Color.green
        }
        return Color.white
    }
    
    private func matchColor() -> Color {
        distance.isPerceptible ? Color("lemon-yellow") : Color.green
    }
}
