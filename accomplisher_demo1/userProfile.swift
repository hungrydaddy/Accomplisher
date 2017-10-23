//
//  userProfile.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 3/3/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class userProfile: UIView {

    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = userName
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    let profilePictureView: UIImageView = {
        let path = Bundle.main.path(forResource: "logo", ofType: "png")
        let pic = UIImage(contentsOfFile: path!)
        let view = UIImageView(image: pic)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profilePictureView)
        addSubview(userNameLabel)
        setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    func setupConstraints(){
        setupPic()
        setupName()
    }
    
    func setupPic(){
        profilePictureView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profilePictureView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        profilePictureView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/4).isActive = true
        profilePictureView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 3/4).isActive = true
    }
    
    func setupName(){
        userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: profilePictureView.bottomAnchor).isActive = true
        userNameLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}


