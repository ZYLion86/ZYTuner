//
//  UIScreenExtensions.swift
//  ZYTuner
//
//  Created by joox on 2023/2/11.
//

import Foundation
import UIKit

extension UIScreen {
    static var width: CGFloat {
        UIScreen.main.bounds.size.width
    }
    static var height: CGFloat {
        UIScreen.main.bounds.size.height
    }
    static var size: CGSize {
        CGSize(width: width, height: height)
    }
}
