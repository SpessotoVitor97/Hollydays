//
//  DestinationDetailsViewController.swift
//  Hollydays
//
//  Created by Vitor Spessoto on 20/02/22.
//

import UIKit

class DestinationDetailsViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var destinationImageView: UIImageView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var destinationName: UILabel!
    @IBOutlet weak var destinationPark: UILabel!
    @IBOutlet weak var destinationState: UILabel!
    @IBOutlet weak var aboutDestination: UILabel!
    @IBOutlet weak var destinationDescription: UILabel!
    
    let viewModel: DestinationDetailsViewModel
    
    init(viewModel: DestinationDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: DestinationDetailsViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        translateDetailsViewOut()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animate()
    }
    
    func animate() {
        UIView.animate(withDuration: 1.0, delay: 0.3, options: .curveEaseOut, animations: {
            var detailsFrame = self.detailsView.frame
            detailsFrame.origin.y -= self.detailsView.frame.height
          
            self.detailsView.frame = detailsFrame
        }, completion: nil)
    }
    
    func translateDetailsViewOut() {
        detailsView.transform = CGAffineTransform(translationX: 0, y: detailsView.frame.height)
    }
    
    func configure() {
        setupScrollView()
        setupDestination()
    }
    
    func setupScrollView() {
        scrollView.delegate = self
        scrollView.bounces = true
        scrollView.bouncesZoom = true
        scrollView.alwaysBounceVertical = true
    }
    
    func setupDestination() {
        let destination = viewModel.destination
        
        destinationImageView.contentMode = .scaleAspectFill
        destinationImageView.image = UIImage(named: destination.imageName)
        
        detailsView.layer.cornerRadius = 15
        detailsView.backgroundColor = .systemBackground
        
        destinationName.textColor = view.backgroundColor == .darkText ? .white : .black
        destinationName.font = .boldSystemFont(ofSize: 21)
        destinationName.text = destination.name
        
        destinationPark.textColor = view.backgroundColor == .darkText ? .white : .black
        destinationPark.font = .boldSystemFont(ofSize: 18)
        destinationPark.text = destination.park
        
        destinationState.textColor = view.backgroundColor == .darkText ? .white : .black
        destinationState.font = .boldSystemFont(ofSize: 18)
        destinationState.text = destination.state
        
        aboutDestination.textColor = view.backgroundColor == .darkText ? .white : .black
        aboutDestination.font = .boldSystemFont(ofSize: 19)
        aboutDestination.text = "About \(destination.name):"
        
        destinationDescription.textColor = view.backgroundColor == .darkText ? .white : .black
        destinationDescription.font = .systemFont(ofSize: 18)
        destinationDescription.textAlignment = .justified
        destinationDescription.numberOfLines = .min
        destinationDescription.text = destination.description
    }
}

extension DestinationDetailsViewController: UIScrollViewDelegate {}
