//
//  StringExtension.swift
//  ZYTuner
//
//  Created by joox on 2023/2/13.
//

import Foundation
import UIKit

extension String {
    
    func textWidth(fontSize: CGFloat) -> CGFloat{
        return textWidth(font: .systemFont(ofSize: fontSize))
    }
    
    func textWidth(height: CGFloat = CGFloat(MAXFLOAT), font: UIFont) -> CGFloat{
        let string = self as NSString
        let origin = NSStringDrawingOptions.usesLineFragmentOrigin
        let lead = NSStringDrawingOptions.usesFontLeading
        let rect = string.boundingRect(
            with: CGSize(width: 0, height: height),
            options: [origin, lead],
            attributes: [NSAttributedString.Key.font:font],
            context: nil
        )
        return rect.width
    }
}
