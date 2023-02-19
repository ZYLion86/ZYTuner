//
//  ZYTunerApp.swift
//  ZYTuner
//
//  Created by joox on 2023/2/17.
//

import SwiftUI

@main
struct ZYTunerApp: App {
    init() {
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .white
        UIBarButtonItem.appearance().tintColor = .white
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ZYMainView()
            }
            .navigationViewStyle(.stack)
            .onAppear {
                UIApplication.shared.isIdleTimerDisabled = true
            }
        }
    }
}
