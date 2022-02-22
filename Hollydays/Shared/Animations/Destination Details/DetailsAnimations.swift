//
//  DetailsAnimations.swift
//  Hollydays
//
//  Created by Vitor Spessoto on 21/02/22.
//

import UIKit

typealias DestinationDetailsAnimation = (UIView) -> Void

class DestinationDetails {
    private let animation: DestinationDetailsAnimation
    
    init(animation: @escaping DestinationDetailsAnimation) {
        self.animation = animation
    }
    
    func animate(view: UIView) {
        animation(view)
    }
}
