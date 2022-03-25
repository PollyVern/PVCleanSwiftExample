//
//  LabelAttributed.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import UIKit

final class LabelAttributed {
    
    public func dynamicStarImageOnLabelAttributed(font: UIFont, text: String) -> NSMutableAttributedString {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "star.fill")?.withTintColor(.orange)

        let pointFontSizeHeight = font.pointSize
        imageAttachment.bounds = CGRect(x: -3, y: -2, width: pointFontSizeHeight + 2, height: pointFontSizeHeight)

        let attachmentString = NSAttributedString(attachment: imageAttachment)

        let completeText = NSMutableAttributedString(string: "")

        completeText.append(attachmentString)

        let textAfterIcon = NSAttributedString(string: text)
        completeText.append(textAfterIcon)

        return completeText
    }
    
}

