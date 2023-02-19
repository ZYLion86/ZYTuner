//
//  ZYGridView.swift
//  ZYTuner
//
//  Created by joox on 2023/2/17.
//

import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

struct ZYGridView: View {
    @State private var orientation = UIDevice.current.orientation
    @State private var width = UIScreen.width
    @State private var height = UIScreen.height
    @State private var viewDidLoad = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 40) {
                ForEach(0..<Int(width / 40.0), id: \.self) { idx in
                    Divider().frame(maxWidth: 1, maxHeight: .infinity).overlay { Color.gray.opacity(0.13) }
                }
            }
            VStack(spacing: 40) {
                ForEach(0..<Int(height / 40.0), id: \.self) { idx in
                    Divider().frame(maxWidth: .infinity, maxHeight: 1).overlay { Color.gray.opacity(0.13) }
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            if UIScreen.width > UIScreen.height {
                width = max(UIScreen.width, UIScreen.height)
                height = min(UIScreen.width, UIScreen.height)
            } else {
                width = min(UIScreen.width, UIScreen.height)
                height = max(UIScreen.width, UIScreen.height)
            }
        }
        .onRotate { newValue in
            orientation = newValue
        }
        .onChange(of: orientation) { newValue in
            if viewDidLoad == false {
                viewDidLoad = true
                return
            }
            if newValue.isLandscape {
                width = max(UIScreen.width, UIScreen.height)
                height = min(UIScreen.width, UIScreen.height)
            } else {
                width = min(UIScreen.width, UIScreen.height)
                height = max(UIScreen.width, UIScreen.height)
            }
        }
    }
}

struct ZYGridView_Previews: PreviewProvider {
    static var previews: some View {
        ZYGridView()
    }
}
