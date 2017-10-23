//
//  rankingCell.swift
//  accomplisher_demo1
//
//  Created by Austin & Rachel on 1/4/17.
//  Copyright © 2017 Austin & Rachel. All rights reserved.
//

import UIKit

class rankingCell: UITableViewCell {
    
    var likeButtonHeightAnchor: NSLayoutConstraint?
    var likeButtonWeightAnchor: NSLayoutConstraint?
    
    
    let avatar: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "logo.png"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    
    
    let userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User"
        
        return label
    }()
    
    let rankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "rank"
        
        return label
    }()
    
    let progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.brown
        label.textAlignment = NSTextAlignment.center
        label.text = "57%"
        
        return label
    }()
    

    lazy var likeButton: UIButton = {
        let bt = UIButton(type: UIButtonType.custom)
        bt.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "Hearts-50.png")
        bt.setBackgroundImage(image, for: UIControlState.normal)
        bt.addTarget(self, action: #selector(handleHeartBigger), for: UIControlEvents.touchUpInside)
        
        return bt
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: "rankingCell")
        
        setupRankLabel()
        setupAvatar()
        setuoNameLabel()
        setupLikeButton()
        setupProgressLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
        // Configure the view for the selected state
    }
    
    
    
    func setupAvatar() {
        contentView.addSubview(avatar)
        avatar.leftAnchor.constraint(equalTo: rankLabel.rightAnchor, constant: 15).isActive = true
        avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        avatar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 36).isActive = true

    }
    
    func setuoNameLabel() {
        contentView.addSubview(userName)
        userName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        userName.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 12).isActive = true
        userName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        userName.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

    
    func setupProgressLabel() {
        contentView.addSubview(progressLabel)
        progressLabel.rightAnchor.constraint(equalTo: likeButton.leftAnchor, constant: -12).isActive = true
        progressLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        progressLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        progressLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    
    func setupLikeButton() {
        contentView.addSubview(likeButton)
        likeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        likeButton.centerXAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25).isActive = true
        likeButtonWeightAnchor = likeButton.widthAnchor.constraint(equalToConstant: 25)
        likeButtonWeightAnchor?.isActive = true
        
        likeButtonHeightAnchor = likeButton.heightAnchor.constraint(equalToConstant: 25)
        likeButtonHeightAnchor?.isActive = true
    
    }
    
    func setupRankLabel() {
        contentView.addSubview(rankLabel)
        rankLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        rankLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        rankLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        rankLabel.widthAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    
    
    func handleHeartBigger() {
        
        //bigger
        UIView.animate(withDuration: 0.1, delay: 0.1, options: UIViewAnimationOptions.curveEaseIn, animations: {
            
            self.likeButtonWeightAnchor?.constant = 50
            self.likeButtonHeightAnchor?.constant = 50
            self.layoutIfNeeded()
            
        }, completion: nil)
        
        
        //smaller
        UIView.animate(withDuration: 0.1, delay: 0.2, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            self.likeButtonWeightAnchor?.constant = 25
            self.likeButtonHeightAnchor?.constant = 25
            self.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
}
