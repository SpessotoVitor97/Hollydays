//
//  AnimationFactory.swift
//  Hollydays
//
//  Created by Vitor Spessoto on 21/02/22.
//

import UIKit

enum AnimationFactory {
    enum DestinationList {
        static func makeMoveUpBounceAnimation(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> TableCellAnimation {
            return { cell, indexPath, tableView in
                cell.transform = CGAffineTransform(translationX: 0, y: rowHeight)
                UIView.animate(withDuration: duration, delay: delayFactor * Double(indexPath.row), usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
                })
            }
        }
    }
    enum DestinationDetails {
        enum ImageView {
            static func makeCircularAnimation(duration: TimeInterval, delayFactor: Double) {
                return
            }
        }
        enum detailsView {
            static func translateOut(_ view: UIView) {
                view.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
            }
            
            static func makeMoveUpAnimation(duration: TimeInterval, delayFactor: Double) -> DestinationDetailsAnimation {
                return { view in
                    UIView.animate(withDuration: duration, delay: delayFactor, options: .curveEaseOut, animations: {
                        var detailsFrame = view.frame
                        detailsFrame.origin.y -= view.frame.height
                        view.frame = detailsFrame
                    })
                }
            }
        }
    }
}

