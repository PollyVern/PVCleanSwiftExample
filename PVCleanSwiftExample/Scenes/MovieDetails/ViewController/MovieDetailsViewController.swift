//
//  MovieDetailsViewController.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import UIKit

//MARK: - Protocol
protocol MovieDetailsDisplayLogic: AnyObject {
    func movieDetailsDisplay(data: [MovieDetailsViewModel])
    func movieCreditsDisplay(data: [MovieCreditsViewModel])
}

class MovieDetailsViewController: UIViewController {
    
    //MARK: - Internal vars
    private var displayMovieDetails = [MovieDetailsViewModel]()
    private var displayMovieCredits = [MovieCreditsViewModel]()
    var statusBarHeight = CGFloat()
    var movieID = Int()
    
    //MARK: - External vars
    private var detailsInteractor: DetailsBusinessLogic?
    private var creditsInteractor: CreditsBusinessLogic?
    
    //MARK: - Internal UI vars
    lazy var movieDetailsView: MovieDetailsView = {
        var view = MovieDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        detailsInteractor?.loadMovieDetails(movieID: movieIDSetup())
        creditsInteractor?.loadMovieCredits(movieID: movieIDSetup())
        configureDetailView()
        tapGestureDismiss()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    }
    
    //MARK: - Helpers
    private func setup() {
        let viewController = self
        let presenter = MovieDetailsPresenter()
        let interactor = MovieDetailsInteractor()
        interactor.detailsPresenter = presenter
        interactor.creditsPresenter = presenter
        presenter.viewController = viewController
        viewController.detailsInteractor = interactor
        viewController.creditsInteractor = interactor
    }
    
    private func movieIDSetup() -> MovieDetailsRequest {
        var movieDetailsRequest = [MovieDetailsRequest]()
        movieDetailsRequest.removeAll()
        movieDetailsRequest.append(MovieDetailsRequest(movieId: movieID))
        return movieDetailsRequest[0]
    }
    
    private func configureDetailView() {
        view.addSubview(movieDetailsView)
        movieDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        movieDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        movieDetailsView.topAnchor.constraint(equalTo: view.topAnchor, constant: statusBarHeight).isActive = true
        movieDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    
    private func tapGestureDismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        movieDetailsView.addGestureRecognizer(tap)
    }
    
    @objc private func handleGesture(gesture: UITapGestureRecognizer) -> Void {
        self.dismiss(animated: true)
    }
 
}

//MARK: - MovieDetailsDisplayLogic
extension MovieDetailsViewController: MovieDetailsDisplayLogic {
    func movieDetailsDisplay(data: [MovieDetailsViewModel]) {
        displayMovieDetails.removeAll()
        displayMovieDetails.append(contentsOf: data)
        movieDetailsView.detailsSetup(data: displayMovieDetails[0])
    }
    
    func movieCreditsDisplay(data: [MovieCreditsViewModel]) {
        displayMovieCredits.removeAll()
        displayMovieCredits.append(contentsOf: data)
        movieDetailsView.creditsSetup(data: displayMovieCredits[0])
    }
 }

