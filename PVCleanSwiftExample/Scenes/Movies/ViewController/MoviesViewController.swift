//
//  MoviesViewController.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

/* ----------------------------------------------!!!------------------------------------------------
 ------------------------Для работы с приложением нужно добавить API ключ в-------------------------
 ---------------------------------------переменную окружения----------------------------------------
 
 1. Скопируйте свой API ключ с сайта https://www.themoviedb.org/settings/api
 2. Перейдите в Xcode -> Edit Scheme... ->
 3. ... -> Run -> Arguments -> Environment Variables
 4. И создайте новую переменную окружения с именем "APIkey". В значение вставьте ключ API.
 ------------------------------------------------!!!------------------------------------------------
 */

import UIKit

// MARK: - Protocol
protocol MoviesDisplayLogic: AnyObject {
    func display(data: [MoviesCoverCollectionViewCellModel])
}

protocol MoviesViewControllerDelegate {
    func handleToggle()
}

class MoviesViewController: UIViewController {
    // MARK: - Internal var
    lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView()
        return collectionView
    }()
        
    // MARK: - External var
    private var interactor: BusinessLogic?
    private(set) var router: MoviesRoutingLogic?
    private var displayMoviesIDs = [MoviesCoverCollectionViewCellModel]()
    var delegate: MoviesViewControllerDelegate?
    
    // MARK: - Lifecycle
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
        interactor?.loadMovies()
        configureTableView()
        configureNavigation()
    }

    private func setup() {
        let viewController = self
        let presenter = MoviesPresenter()
        let interactor = MoviesInteractor()
        let router = MoviesRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
    }
 
    // MARK: - Internal logic
    private func configureTableView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: CollectionViewLayout().createCollectionViewLayout())
        collectionView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        collectionView.register(MoviesCoverCollectionViewCell.self, forCellWithReuseIdentifier: "MoviesCoverCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(ColorConstants.backgroundColor)
        view.addSubview(collectionView)
    }
    
    // MARK: - Helpers
    private func configureNavigation() {
        navigationItem.title = NavigationTitleConstants.movieBrowser
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(ColorConstants.navigationColor)
            
            let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor(ColorConstants.textColor)]
            appearance.titleTextAttributes = titleAttribute
            
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController?.navigationBar.barTintColor = UIColor(ColorConstants.backgroundColor)
            navigationController?.navigationBar.tintColor = UIColor(ColorConstants.titleColor)
        }
        
        let personImage = UIImage(systemName: "person.crop.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 18))?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(ColorConstants.titleColor))
        let profileButtonItem = UIBarButtonItem(image: personImage, style: .done, target: self, action: #selector(openProfileViewController))
        navigationItem.setLeftBarButton(profileButtonItem, animated: false)
    }
    
    @objc func openProfileViewController() {
        delegate?.handleToggle()
    }
}

// MARK: - MoviesDisplayLogic
extension MoviesViewController: MoviesDisplayLogic {
    func display(data: [MoviesCoverCollectionViewCellModel]) {
        self.displayMoviesIDs.removeAll()
        self.displayMoviesIDs.append(contentsOf: data)
        self.collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate
extension MoviesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.navigateToDetails(movieID: displayMoviesIDs[indexPath.row].id)
    }
}

// MARK: - UICollectionViewDataSource
extension MoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayMoviesIDs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCoverCollectionViewCell", for: indexPath) as! MoviesCoverCollectionViewCell
        cell.setup(data: displayMoviesIDs[indexPath.row])
        print(displayMoviesIDs.count)

        return cell
    }
    
}
