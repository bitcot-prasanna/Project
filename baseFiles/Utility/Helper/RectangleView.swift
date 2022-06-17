//
//  RectangleView.swift
//  PickPic
//
//  Created by mac on 11/11/20.
//

import Foundation
import UIKit

class RectangleView : UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.red.cgColor
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Required, but Will not be called in a Playground")
    }
}
