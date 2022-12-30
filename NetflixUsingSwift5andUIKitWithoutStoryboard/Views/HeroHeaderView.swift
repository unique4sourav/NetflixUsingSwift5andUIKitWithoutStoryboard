//
//  HeroHeaderView.swift
//  NetflixUsingSwift5andUIKitWithoutStoryboard
//
//  Created by Sourav on 30/12/22.
//

import UIKit

class HeroHeaderView: UIView {
    private var didViewLayoutForFirst = false
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "the inception")
        return imageView
    } ()
    
    private let playButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    
    private let downloadButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.label.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        if !didViewLayoutForFirst {
            didViewLayoutForFirst.toggle()
            
            imageView.addConstraints(constraints: [
                imageView.topAnchor.constraint(equalTo: self.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
            
            playButton.addConstraints(constraints: [
                playButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -self.frame.width/4),
                playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -self.frame.height/8),
                playButton.widthAnchor.constraint(equalToConstant: 100)
            ])
            
            downloadButton.addConstraints(constraints: [
                downloadButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: self.frame.width/4),
                downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -self.frame.height/8),
                downloadButton.widthAnchor.constraint(equalToConstant: 100)
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = frame
        layer.addSublayer(gradientLayer)
    }
}
