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
            Image("icon-120").resizable().frame(width: 80, height: 80).cornerRadius(20)
            Text(AppName + " " + productName).font(.system(size: 18))
            Text(AppVersion).font(.system(size: 14)).foregroundColor(Color("light-gray"))
            Text(AppBuild).font(.system(size: 12)).foregroundColor(Color("light-gray"))
            Spacer()
        }
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
