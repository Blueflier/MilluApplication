//
//  questionCard.swift
//  MilluApplication
//
//  Created by Ellieanna Ross on 9/9/22.
//

import Foundation
import UIKit

//questionCard which inherits from templateCard
class questionCard: templateCard {
    var age: Int                //reccomended age
    var devTags: Array<String>  //such as popular, featured, reccomended, qotd, etc.
    
    override init() {
        age = 4
        devTags = []
    }
    
    
}




class questionCardView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    //subviews to add
    var image: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 110))
    //var iconBg: UIView = UIView(frame: CGRect(x: 20, y: 15, width: 50, height: 50))
    var titleLabel: UILabel = UILabel(frame: CGRect(x: 10, y: 105, width: 200, height: 50))
    var questionLabel: UILabel = UILabel(frame: CGRect(x: 10, y: 110, width: 190, height: 200))
    var ageLabel: UILabel = UILabel(frame: CGRect(x: 10, y: 250, width: 200, height: 50))

   // var timeLabel: UILabel = UILabel(frame: CGRect(x: 75, y: 25, width: 200, height: 50))
    
    
    
    private func setupView() {
        
        //view setup
        backgroundColor = .white
        layer.cornerRadius = 13
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 10
        
        // function call to add subviews
        addSubviews()
    }
    
    
    func addSubviews() {
        // 150 wide 250 tall
        
        image.image = UIImage(named: "placeholderImage")
        
        image.layoutIfNeeded()
        image.layer.cornerRadius = 13//image.frame.size.width * 0.05
        image.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        image.clipsToBounds = true
        addSubview(image)
        
        
        titleLabel.text = "Inventing Clothes"
        titleLabel.font = UIFont(name: "Jost-Medium", size: 20)
        addSubview(titleLabel)
        
        questionLabel.text = "How could you make clothes better?"
        questionLabel.font = UIFont(name: "Jost-Regular", size: 15)
        questionLabel.numberOfLines = 5
        addSubview(questionLabel)
        
        ageLabel.text = "Ages 5+"
        ageLabel.font = UIFont(name: "Jost-ExtraLight", size: 15)
        addSubview(ageLabel)
    }
}
