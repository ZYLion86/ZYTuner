//
//  ZYSettingsView.swift
//  ZYTuner
//
//  Created by joox on 2023/2/17.
//

import SwiftUI

struct ZYSettingsView: View {
    private let productName = "tuner"
    var body: some View {
        VStack {
            Spacer()
            Image("icon-120").resizable().frame(width: 80, height: 80).overlay(RoundedRectangle(cornerRadius: 20).stroke().foregroundColor(Color.white))
            Text(AppName + " " + productName).font(.system(size: 18))
            Spacer().frame(height: 6)
            Text(AppVersion).font(.system(size: 14)).foregroundColor(Color("light-gray"))
            Spacer().frame(height: 6)
            Text(AppBuild).font(.system(size: 12)).foregroundColor(Color("light-gray"))
            Spacer()
        }
        .preferredColorScheme(.dark)
        .ignoresSafeArea()
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct ZYSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ZYSettingsView()
    }
}
