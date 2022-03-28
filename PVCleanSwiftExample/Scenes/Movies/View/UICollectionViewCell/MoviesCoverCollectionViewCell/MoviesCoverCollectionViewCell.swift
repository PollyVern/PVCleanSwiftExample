//
//  MoviesCoverCollectionViewCell.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import UIKit

// MARK: - Protocol
protocol Movies {
    func presentGenresData()
}

class MoviesCoverCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    private let windowFrameHeight = UIWindow().frame.height
    private let subTitleFont = UIFont.systemFont(ofSize: 17)
    private let titleFont = UIFont.systemFont(ofSize: 20)
    
    private lazy var coverImageView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleToFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var backgroundOpacityView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray.withAlphaComponent(0.9)
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .white
        label.font = titleFont
        return label
    }()

    private lazy var genresLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .white.withAlphaComponent(0.5)
        label.font = subTitleFont
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .white.withAlphaComponent(0.5)
        label.font = subTitleFont
        return label
    }()

    private lazy var nameStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private lazy var durationLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .white
        label.font = subTitleFont
        return label
    }()
    
    private lazy var voteAverageLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .white
        label.font = titleFont
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        posterConstraint()
        descriptionConstraint()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.coverImageView.image = nil
    }
    
    // MARK: - Setup
    public func setup(data: MoviesCoverCollectionViewCellModel) {
        
        LoadImages().loadImageW500(partOfURL: data.posterPath!) { poster in
            self.coverImageView.image = poster
        }

        nameLabel.text = data.name
        genresLabel.text = data.genres
        dateLabel.text = data.date
        durationLabel.text = data.runtime
        voteAverageLabel.attributedText = LabelAttributed().dynamicStarImageOnLabelAttributed(font: subTitleFont, text: data.voteAverage!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}

extension MoviesCoverCollectionViewCell {
    
    // MARK: - Constraints
    private func posterConstraint() {
        // UIImageView - coverImageView
        self.addSubview(coverImageView)
        coverImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        coverImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        coverImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func descriptionConstraint() {
        // UIView - backgroundOpacityView
        coverImageView.addSubview(backgroundOpacityView)
        backgroundOpacityView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundOpacityView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        backgroundOpacityView.heightAnchor.constraint(equalToConstant: self.frame.width/2.5).isActive = true
        backgroundOpacityView.bottomAnchor.constraint(equalTo: coverImageView.bottomAnchor).isActive = true
        
        // UIStackView - stackView
        backgroundOpacityView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: backgroundOpacityView.leadingAnchor, constant: 5).isActive = true
        stackView.trailingAnchor.constraint(equalTo: backgroundOpacityView.trailingAnchor, constant: -5).isActive = true
        stackView.topAnchor.constraint(equalTo: backgroundOpacityView.topAnchor, constant: 5).isActive = true
        stackView.bottomAnchor.constraint(equalTo: backgroundOpacityView.bottomAnchor, constant: -5).isActive = true

        // UIStackView - nameStackView
        stackView.addArrangedSubview(nameStackView)
        nameStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        nameStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
        nameStackView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true

        // UILabel - durationLabel
        stackView.addArrangedSubview(durationLabel)
        durationLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        durationLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
        durationLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0).isActive = true


        // UILabel - nameLabel
        nameStackView.addArrangedSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: nameStackView.leadingAnchor, constant: 0).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: nameStackView.trailingAnchor, constant: 0).isActive = true

        // UILabel - genresDateLabel
        nameStackView.addArrangedSubview(genresLabel)
        genresLabel.leadingAnchor.constraint(equalTo: nameStackView.leadingAnchor, constant: 0).isActive = true
        genresLabel.trailingAnchor.constraint(equalTo: nameStackView.trailingAnchor, constant: 0).isActive = true

        // UILabel - dateLabel
        nameStackView.addArrangedSubview(dateLabel)
        dateLabel.leadingAnchor.constraint(equalTo: nameStackView.leadingAnchor, constant: 0).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: nameStackView.trailingAnchor, constant: 0).isActive = true
        
        // UILabel - voteAverageLabel
        stackView.addSubview(voteAverageLabel)
        voteAverageLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        voteAverageLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        voteAverageLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        voteAverageLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
}

