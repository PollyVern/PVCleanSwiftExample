//
//  MovieDetaislView.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import UIKit

class MovieDetailsView: UIView {
    
    //MARK: - Internal var
    private let windowFrameHeight = UIWindow().frame.height
    private let windowFrameWidth = UIWindow().frame.width
    private let starFillImage = UIImage(systemName: "star.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15))?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.orange)
    private let starImage = UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15))?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.orange)
    private let subTitleFont = UIFont.systemFont(ofSize: 17)
    private let titleFont = UIFont.systemFont(ofSize: 20)
    
    //MARK: - Internal UI var
    private lazy var containerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(ColorConstants.backgroundColor)
        return view
    }()
    
    private lazy var durationLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = UIColor(ColorConstants.textColor)
        label.textAlignment = .center
        label.font = subTitleFont
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = UIColor(ColorConstants.titleColor)
        label.textAlignment = .center
        label.font = titleFont
        return label
    }()
    
    private lazy var coverImageView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private lazy var textStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private lazy var textGenresLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = UIColor(ColorConstants.titleColor)
        label.text = "Жанры"
        label.textAlignment = .right
        label.font = subTitleFont
        return label
    }()
    
    private lazy var textDirectorsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = UIColor(ColorConstants.titleColor)
        label.text = "Съемочная\nгруппа"
        label.textAlignment = .right
        label.font = subTitleFont
        return label
    }()
    
    private lazy var textStarsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = UIColor(ColorConstants.titleColor)
        label.text = "Главные\nроли"
        label.textAlignment = .right
        label.font = subTitleFont
        return label
    }()
    
    private lazy var genresLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = UIColor(ColorConstants.textColor)
        label.font = subTitleFont
        return label
    }()
    
    private lazy var directorsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = UIColor(ColorConstants.textColor)
        label.font = subTitleFont
        return label
    }()
    
    private lazy var starsLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = UIColor(ColorConstants.textColor)
        label.font = subTitleFont
        return label
    }()
    
    private lazy var textView: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor(ColorConstants.textColor)
        textView.backgroundColor = UIColor(ColorConstants.backgroundColor)
        textView.font = subTitleFont
        textView.isEditable = false
        return textView
    }()
    
    private lazy var starsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private lazy var star1ImageView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = starImage
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var star2ImageView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = starImage
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var star3ImageView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = starImage
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var star4ImageView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = starImage
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var star5ImageView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = starImage
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainConstraint()
        durationConstraint()
        starsConstraint()
        nameConstraint()
        posterConstraint()
        creditsConstraint()
        descriptionConstraint()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCirclesMaskAndCornerRadius()
        makeDashedBorderLine(textViewHeight: calculateTextViewHeight(), selfHeight: self.frame.height)
    }
    
    //MARK: - Setup
    public func detailsSetup(data: MovieDetailsViewModel) {
        durationLabel.text = data.runtime
        nameLabel.text = data.name
        genresLabel.text = data.genres
        textView.text = data.description
        LoadImages().loadImageW500(partOfURL: data.backdropPath!) { poster in
            self.coverImageView.image = poster
        }
        
        starsVoteAverage(stars: data.starsVoteAverage ?? 0)
    }
    
    public func creditsSetup(data: MovieCreditsViewModel) {
        directorsLabel.text = data.directors
        starsLabel.text = data.stars
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension MovieDetailsView {
    
    //MARK: - Helpers
    private func updateCirclesMaskAndCornerRadius() {
        containerView.circlesMask()
        containerView.bottomRoundCorners(corners: [.bottomLeft, .bottomRight])
    }
    
    private func calculateTextViewHeight() -> CGFloat{
        self.layoutIfNeeded()
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        let frame = textView.convert(textView.frame, to: keyWindow)
        return frame.height
    }
    
    private func starsVoteAverage(stars: Int) {
        let starsImageViews = [star1ImageView, star2ImageView, star3ImageView, star4ImageView, star5ImageView]
        for i in 0...stars-1 {
            starsImageViews[i].image = starFillImage
        }
    }
    
}

extension MovieDetailsView {
    
    //MARK: - Constraint
    private func mainConstraint() {
        //UIView - containerView
        self.addSubview(containerView)
        self.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        self.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
    }
    
    private func durationConstraint() {
        //UILabel - durationLabel
        containerView.addSubview(durationLabel)
        durationLabel.widthAnchor.constraint(equalToConstant: windowFrameWidth/4).isActive = true
        durationLabel.heightAnchor.constraint(equalToConstant: windowFrameHeight/50).isActive = true
        durationLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -windowFrameWidth/4).isActive = true
        durationLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
    }
    
    private func starsConstraint() {
        //UIStackView - starsStackView
        containerView.addSubview(starsStackView)
        starsStackView.widthAnchor.constraint(equalToConstant: windowFrameWidth/4).isActive = true
        starsStackView.heightAnchor.constraint(equalToConstant: windowFrameHeight/50).isActive = true
        starsStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: windowFrameWidth/4).isActive = true
        starsStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        
        //UIImageView - star1ImageView
        starsStackView.addArrangedSubview(star1ImageView)
        star1ImageView.topAnchor.constraint(equalTo: starsStackView.topAnchor).isActive = true
        star1ImageView.bottomAnchor.constraint(equalTo: starsStackView.bottomAnchor).isActive = true
        
        //UIImageView - star2ImageView
        starsStackView.addArrangedSubview(star2ImageView)
        star2ImageView.topAnchor.constraint(equalTo: starsStackView.topAnchor).isActive = true
        star2ImageView.bottomAnchor.constraint(equalTo: starsStackView.bottomAnchor).isActive = true
        
        //UIImageView - star3ImageView
        starsStackView.addArrangedSubview(star3ImageView)
        star3ImageView.topAnchor.constraint(equalTo: starsStackView.topAnchor).isActive = true
        star3ImageView.bottomAnchor.constraint(equalTo: starsStackView.bottomAnchor).isActive = true
        
        //UIImageView - star4ImageView
        starsStackView.addArrangedSubview(star4ImageView)
        star4ImageView.topAnchor.constraint(equalTo: starsStackView.topAnchor).isActive = true
        star4ImageView.bottomAnchor.constraint(equalTo: starsStackView.bottomAnchor).isActive = true
        
        //UIImageView - star5ImageView
        starsStackView.addArrangedSubview(star5ImageView)
        star5ImageView.topAnchor.constraint(equalTo: starsStackView.topAnchor).isActive = true
        star5ImageView.bottomAnchor.constraint(equalTo: starsStackView.bottomAnchor).isActive = true
    }
    
    private func nameConstraint() {
        //UILabel - nameLabel
        containerView.addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 20).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func posterConstraint() {
        //UIImageView - coverImageView
        containerView.addSubview(coverImageView)
        coverImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        coverImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        coverImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        coverImageView.heightAnchor.constraint(equalToConstant: windowFrameHeight/4).isActive = true
    }
    
    private func creditsConstraint() {
        //UIStackView - textStackView
        containerView.addSubview(textStackView)
        textStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        textStackView.widthAnchor.constraint(equalToConstant: windowFrameWidth/5).isActive = true
        textStackView.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 20).isActive = true
        textStackView.heightAnchor.constraint(equalToConstant: windowFrameHeight/7).isActive = true
        
        //UILabel - textGenresLabel
        textStackView.addArrangedSubview(textGenresLabel)
        textGenresLabel.leadingAnchor.constraint(equalTo: textStackView.leadingAnchor, constant: 0).isActive = true
        textGenresLabel.trailingAnchor.constraint(equalTo: textStackView.trailingAnchor, constant: 0).isActive = true
        textGenresLabel.topAnchor.constraint(equalTo: textStackView.topAnchor, constant: 0).isActive = true
        
        //UILabel - textDirectorsLabel
        textStackView.addArrangedSubview(textDirectorsLabel)
        textDirectorsLabel.leadingAnchor.constraint(equalTo: textStackView.leadingAnchor, constant: 0).isActive = true
        textDirectorsLabel.trailingAnchor.constraint(equalTo: textStackView.trailingAnchor, constant: 0).isActive = true
        
        //UILabel - textStarsLabel
        textStackView.addArrangedSubview(textStarsLabel)
        textStarsLabel.leadingAnchor.constraint(equalTo: textStackView.leadingAnchor, constant: 0).isActive = true
        textStarsLabel.trailingAnchor.constraint(equalTo: textStackView.trailingAnchor, constant: 0).isActive = true
        textStarsLabel.bottomAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 0).isActive = true
        
        //UIStackView - stackView
        containerView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: textStackView.trailingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 20).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: windowFrameHeight/8).isActive = true
        
        //UILabel - genresLabel
        stackView.addArrangedSubview(genresLabel)
        genresLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        genresLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
        genresLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
        
        //UILabel - directorsLabel
        stackView.addArrangedSubview(directorsLabel)
        directorsLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        directorsLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
        
        //UILabel - starsLabel
        stackView.addArrangedSubview(starsLabel)
        starsLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        starsLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
        starsLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func descriptionConstraint() {
        //UITextView - textView
        containerView.addSubview(textView)
        textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        textView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        textView.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 30).isActive = true
        textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
    }
}
