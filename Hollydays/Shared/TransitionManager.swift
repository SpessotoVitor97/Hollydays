//
//  TransitionManager.swift
//  Hollydays
//
//  Created by Vitor Spessoto on 21/02/22.
//

import UIKit

class TransitionManager: NSObject {

    private let duration: TimeInterval
        
    init(duration: TimeInterval) {
        self.duration = duration
    }
}

extension TransitionManager: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from), let toViewController = transitionContext.viewController(forKey: .to) else {
                  transitionContext.completeTransition(false)
                  return
              }
        
        animateTransition(from: fromViewController, to: toViewController, with: transitionContext)
    }
    
    func animateTransition(from fromViewController: UIViewController, to toViewController: UIViewController, with transitionContext: UIViewControllerContextTransitioning) {
        guard let listViewController = fromViewController as? ListViewController,
              let detailsViewController = toViewController as? DestinationDetailsViewController else { return }
        
        presentViewController(detailsViewController, from: listViewController, with: transitionContext)
    }
    
    func presentViewController(_ toViewController: DestinationDetailsViewController, from fromViewController: ListViewController, with transitionContext: UIViewControllerContextTransitioning) {
        guard let currentDestinationCell = fromViewController.currentDestinationCell,
              let destinationImage = fromViewController.currentDestinationCell?.destinationImage,
              let detailsImageView = toViewController.destinationImageView else { return }

        AnimationFactory.DestinationDetails.ViewControllerTransition.animatedTransition(transitionContext, currentDestinationCell, destinationImage, toViewController, detailsImageView, timeInterval: duration)
    }
}

extension TransitionManager: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            return self
        }
        
        return nil
    }
}
