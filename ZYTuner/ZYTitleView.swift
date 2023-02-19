//
//  ZYTitleView.swift
//  ZYTuner
//
//  Created by joox on 2023/2/17.
//

import SwiftUI

struct ZYTitleView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .center) {
                Text("Hi, musician").font(.system(size: 44)).bold()
                Spacer()
                NavigationLink {
                    ZYSettingsView()
                } label: {
                    Image("dot.italic.fill")
                }
            }
            HStack(alignment: .center) {
                Text("Let's make tuning more precise.").font(.system(size: 16))
                Spacer()
            }
        }
        .foregroundColor(.white)
        .frame(height: 68)
    }
}

struct ZYTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ZYTitleView()
    }
}
