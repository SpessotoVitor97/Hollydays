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
    @IBOutlet weak var backButton: UIButton!
    
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
        AnimationFactory.DestinationDetails.detailsView.translateOut(detailsView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateDetailsView()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func configure() {
        setupScrollView()
        setupDestination()
        setupNavigationController()
        setupBackButton()
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
    
    func setupNavigationController() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupBackButton() {
        let backImage = UIImage(named: "CloseButton")
        backButton.setImage(backImage, for: [])
        backButton.setTitle("", for: [])
    }
    
    func animateDetailsView() {
        let animation: DestinationDetailsAnimation = AnimationFactory.DestinationDetails.detailsView.makeMoveUpAnimation(duration: 0.83, delayFactor: 0.03)
        let animator = DestinationDetails(animation: animation)
        animator.animate(view: detailsView)
    }
}

extension DestinationDetailsViewController: UIScrollViewDelegate {}
