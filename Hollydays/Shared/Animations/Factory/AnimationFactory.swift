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
        enum ViewControllerTransition {
            static func animatedTransition(_ transitionContext: UIViewControllerContextTransitioning, _ currentDestinationCell: DestinationTableViewCell, _ destinationImage: UIImageView, _ toViewController: DestinationDetailsViewController, _ detailsImageView: UIImageView, timeInterval: TimeInterval) {
                
                let containerView = transitionContext.containerView
                let snapshotContentView = UIView()
                snapshotContentView.backgroundColor = .clear
                snapshotContentView.frame = containerView.convert(currentDestinationCell.contentView.frame, from: currentDestinationCell)
                snapshotContentView.layer.cornerRadius = currentDestinationCell.contentView.layer.cornerRadius
                
                let destinationDetailsImageView = UIImageView()
                destinationDetailsImageView.clipsToBounds = true
                destinationDetailsImageView.contentMode = destinationImage.contentMode
                destinationDetailsImageView.image = destinationImage.image
                destinationDetailsImageView.layer.cornerRadius = destinationImage.layer.cornerRadius
                destinationDetailsImageView.frame = containerView.convert(destinationImage.frame, from: currentDestinationCell)
                
                containerView.addSubview(toViewController.view)
                containerView.addSubview(snapshotContentView)
                containerView.addSubview(destinationDetailsImageView)
                
                toViewController.view.isHidden = true
                
                let animator = UIViewPropertyAnimator(duration: timeInterval, curve: .easeInOut) {
                    snapshotContentView.frame = containerView.convert(toViewController.view.frame, from: toViewController.view)
                    destinationDetailsImageView.frame = containerView.convert(detailsImageView.frame, from: detailsImageView)
                    destinationDetailsImageView.layer.cornerRadius = 0
                }
                
                animator.addCompletion { position in
                    toViewController.view.isHidden = false
                    destinationDetailsImageView.removeFromSuperview()
                    snapshotContentView.removeFromSuperview()
                    transitionContext.completeTransition(position == .end)
                }
                
                animator.startAnimation()
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

