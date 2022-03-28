//
//  ProfileView.swift
//  PVCleanSwiftExample
//
//  Created by Полина Беловодская  on 25.03.2022.
//

import UIKit

class ProfileView: UIView {

    //MARK: - Internal vars
    private let windowFrameHeight = UIWindow().frame.height
    private let subTitleFont = UIFont.systemFont(ofSize: 17)
    private let titleFont = UIFont.systemFont(ofSize: 20)
    
    private var avatarHeight: CGFloat {
        get {
            return windowFrameHeight/6
        }
    }
    
    private var avatarCornerRadius: CGFloat {
        get {
            return avatarHeight/2
        }
    }
    
    private var buttonsWidth: CGFloat {
        get {
            return avatarHeight/2
        }
    }
    
    private var buttonsCornerRadius: CGFloat {
        get {
            return buttonsWidth/2
        }
    }

    //MARK: - Internal UI vars
    private lazy var avatarImageView: UIImageView = {
        var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "polly")
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = avatarCornerRadius
        imgView.layer.borderColor = UIColor(ColorConstants.lightBackgroundColor).cgColor
        imgView.layer.borderWidth = 4
        return imgView
    }()

    private lazy var nameStackView: UIStackView = {
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
        label.textColor = UIColor(ColorConstants.titleColor)
        label.text = ProfileViewModel().name
        label.textAlignment = .center
        label.font = titleFont
        return label
    }()
    
    private lazy var dateBirthLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = UIColor(ColorConstants.textColor)
        label.text = "Девушка | \(ProfileViewModel().dateBirth)"
        label.textAlignment = .center
        label.font = subTitleFont
        return label
    }()
    
    private lazy var communicationStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private lazy var numberLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = UIColor(ColorConstants.textColor)
        label.text = ProfileViewModel().phoneNumber
        label.textAlignment = .center
        label.font = subTitleFont
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = UIColor(ColorConstants.textColor)
        label.text = ProfileViewModel().email
        label.textAlignment = .center
        label.font = subTitleFont
        return label
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private lazy var callButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = buttonsCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(ColorConstants.lightBackgroundColor)
        button.setImage(UIImage(systemName: "phone", withConfiguration: UIImage.SymbolConfiguration(pointSize: buttonsWidth/2))?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(ColorConstants.titleColor)), for: .normal)
        return button
    }()
    
    private lazy var emailButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = buttonsCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(ColorConstants.lightBackgroundColor)
        button.setImage(UIImage(systemName: "envelope", withConfiguration: UIImage.SymbolConfiguration(pointSize: buttonsWidth/2))?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(ColorConstants.titleColor)), for: .normal)
        return button
    }()
    
    private lazy var closeButton: UIButton = {
        var button = UIButton()
        button.layer.cornerRadius = buttonsWidth/2/2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(ColorConstants.lightBackgroundColor)
        button.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: buttonsWidth/2/2))?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(ColorConstants.titleColor)), for: .normal)
        return button
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(ColorConstants.backgroundColor)
        avatarConstraint()
        upStackConstraint()
        downStackConstraint()
        buttonsStackConstraint()
        closeButtonConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension ProfileView {
    //MARK: - Constraint
    private func avatarConstraint() {
        //UIImageView
        self.addSubview(avatarImageView)
        avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        avatarImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: avatarHeight).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: avatarHeight).isActive = true
    }
    
    private func upStackConstraint() {
        //UIStackView - nameStackView
        self.addSubview(nameStackView)
        nameStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        nameStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        nameStackView.bottomAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: -20).isActive = true
        nameStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        //UILabel - nameLabel
        nameStackView.addArrangedSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: nameStackView.leadingAnchor, constant: 0).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: nameStackView.trailingAnchor, constant: 0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: nameStackView.topAnchor, constant: 0).isActive = true
        
        //UILabel - dateBirthLabel
        nameStackView.addArrangedSubview(dateBirthLabel)
        dateBirthLabel.leadingAnchor.constraint(equalTo: nameStackView.leadingAnchor, constant: 0).isActive = true
        dateBirthLabel.trailingAnchor.constraint(equalTo: nameStackView.trailingAnchor, constant: 0).isActive = true
        dateBirthLabel.bottomAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func downStackConstraint() {
        //UIStackView - communicationStackView
        self.addSubview(communicationStackView)
        communicationStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        communicationStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        communicationStackView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20).isActive = true
        communicationStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        //UILabel - numberLabel
        communicationStackView.addArrangedSubview(numberLabel)
        numberLabel.leadingAnchor.constraint(equalTo: communicationStackView.leadingAnchor, constant: 0).isActive = true
        numberLabel.trailingAnchor.constraint(equalTo: communicationStackView.trailingAnchor, constant: 0).isActive = true
        numberLabel.topAnchor.constraint(equalTo: communicationStackView.topAnchor, constant: 0).isActive = true
        
        //UILabel - emailLabel
        communicationStackView.addArrangedSubview(emailLabel)
        emailLabel.leadingAnchor.constraint(equalTo: communicationStackView.leadingAnchor, constant: 0).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: communicationStackView.trailingAnchor, constant: 0).isActive = true
        emailLabel.bottomAnchor.constraint(equalTo: communicationStackView.bottomAnchor, constant: 0).isActive = true
    }

    private func buttonsStackConstraint() {
        //UIStackView - buttonsStackView
        self.addSubview(buttonsStackView)
        buttonsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70).isActive = true
        buttonsStackView.topAnchor.constraint(equalTo: communicationStackView.bottomAnchor, constant: 20).isActive = true
        buttonsStackView.heightAnchor.constraint(equalToConstant: buttonsWidth).isActive = true
        
        //UILabel - callButton
        buttonsStackView.addArrangedSubview(callButton)
        callButton.topAnchor.constraint(equalTo: buttonsStackView.topAnchor).isActive = true
        callButton.bottomAnchor.constraint(equalTo: buttonsStackView.bottomAnchor).isActive = true
        callButton.leadingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor).isActive = true
        callButton.widthAnchor.constraint(equalToConstant: buttonsWidth).isActive = true

        //UILabel - emailButton
        buttonsStackView.addArrangedSubview(emailButton)
        emailButton.topAnchor.constraint(equalTo: buttonsStackView.topAnchor).isActive = true
        emailButton.bottomAnchor.constraint(equalTo: buttonsStackView.bottomAnchor).isActive = true
        emailButton.trailingAnchor.constraint(equalTo: buttonsStackView.trailingAnchor).isActive = true
        emailButton.widthAnchor.constraint(equalToConstant: buttonsWidth).isActive = true
    }
    
    private func closeButtonConstraint() {
        //UIButton - closeButton
        self.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: UIApplication.statusBarHeight).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: buttonsWidth/2).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: buttonsWidth/2).isActive = true
    }
}

