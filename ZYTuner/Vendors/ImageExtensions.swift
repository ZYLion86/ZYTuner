//
//  ImageExtensions.swift
//  ZYTuner
//
//  Created by joox on 2023/2/11.
//

import SwiftUI
import Foundation

extension Image {
    @ViewBuilder
    func resize(_ size: CGSize, _ mode: ContentMode = .fill, cliped: Bool = true) -> some View {
        if cliped {
            self.resizable().aspectRatio(contentMode: mode).frame(width: size.width, height: size.height).clipped()
        } else {
            self.resizable().aspectRatio(contentMode: mode).frame(width: size.width, height: size.height)
        }
    }
}
