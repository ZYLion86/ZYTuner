//
//  ContentView.swift
//  ZYTuner
//
//  Created by joox on 2023/2/17.
//

import SwiftUI
import AVFoundation
import MicrophonePitchDetector

func MicrophoneAccessAlert() -> Alert {
    Alert(
        title: Text("No microphone access"),
        message: Text(
            """
            Please grant microphone access in the Settings app in the "Privacy ⇾ Microphone" section.
            """
        )
    )
}

struct ZYMainView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var detector = MicrophonePitchDetector()
    @State private var selected: String = ""
    @State private var selectedNote: String = ""
    @State private var selectedOctave: String = ""
    @State private var viewDidLoad = false
    
    init() {
        UIPageControl.appearance().tintColor = .white
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            ZYGridView()
            VStack(spacing: 0) {
                Spacer().frame(height: 68)
                Spacer()
                ZYHUD(detector: detector, selectedNote: $selectedNote, selectedOctave: $selectedOctave)
                Spacer().frame(height: 20)
                TabView {
                    ZYGuitarView(selected: $selected, selectedNote: $selectedNote, selectedOctave: $selectedOctave)
                    ZYUkuleleView(selected: $selected, selectedNote: $selectedNote, selectedOctave: $selectedOctave)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(height: 300)
                Spacer().frame(height: 20)
            }
            .onChange(of: scenePhase) { phase in
                switch phase {
                case .active:
                    startAudio()
                case .inactive, .background:
                    stopAudio()
                @unknown default:
                    stopAudio()
                }
            }
            .onAppear {
                guard viewDidLoad == true else {
                    viewDidLoad = true
                    return
                }
                startAudio()
            }
            .onDisappear {
                stopAudio()
            }
            .alert(isPresented: $detector.showMicrophoneAccessAlert) {
                MicrophoneAccessAlert()
            }
            VStack(spacing: 0) {
                Spacer().frame(height: 44)
                ZYTitleView()
                Spacer()
            }
            .padding(.horizontal)
        }
        .background(Color.black)
    }
    
    private func startAudio() {
        detector.start()
    }
    
    private func stopAudio() {
        detector.stop()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZYMainView()
    }
}
