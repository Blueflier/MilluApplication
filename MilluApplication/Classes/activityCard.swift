//
//  activityCard.swift
//  MilluApplication
//
//  Created by Ellieanna Ross on 9/9/22.
//

import Foundation
import UIKit

//activityCard which inherits from template card
class activityCard: templateCard {
    var icon: UIImage       //image storing the icon
    var time: String        //not sure what data type this should be
    
    override init() {       //not entirely sure how this should look
        icon = UIImage(named: "test")!      //not a real image
        time = ""
    }
    
}

class activityCardView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    
    //subviews to add
    var icon: UIImageView = UIImageView(frame: CGRect(x: 27, y: 23, width: 35, height: 35))
    var iconBg: UIView = UIView(frame: CGRect(x: 20, y: 15, width: 50, height: 50))
    var titleLabel: UILabel = UILabel(frame: CGRect(x: 75, y: 5, width: 200, height: 50))
    var timeLabel: UILabel = UILabel(frame: CGRect(x: 75, y: 25, width: 200, height: 50))
    
    private func setupView() {
        
        //view setup
        backgroundColor = .white
        layer.cornerRadius = 13
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 10
        addSubviews()
    }
    
    
    func addSubviews() {
        
        iconBg.layer.cornerRadius = 10
        addSubview(iconBg)
        
        icon.contentMode = .scaleAspectFit
        addSubview(icon)
        
        titleLabel.font = UIFont(name: "Jost-Medium", size: 20)
        titleLabel.textColor = UIColor(named: "lightTextColor")
        addSubview(titleLabel)
        
        timeLabel.text = "10 am to 10:15 am"
        timeLabel.font = UIFont(name: "Jost-Regular", size: 12)
        timeLabel.textColor = UIColor(named: "lightTextColor")
        addSubview(timeLabel)
        
        
        
    }
    
    func activityType(type: String, time: String) {
        //conversation
        if (type == "conversation") {
            icon.image = UIImage(named: "conversationIcon")
            iconBg.backgroundColor = UIColor(named: "pink")
            titleLabel.text = "Conversation Starter"

        }
        //activity
        else if (type == "activity") {
            icon.image = UIImage(named: "activityIcon")
            iconBg.backgroundColor = UIColor(named: "blue")
            titleLabel.text = "Activity"
        }
        //storytime
        else if (type == "storytime") {
            icon.image = UIImage(named: "bookIcon")
            iconBg.backgroundColor = UIColor(named: "orange")
            titleLabel.text = "Storytime"
        }
        
    
        
        
        timeLabel.text = time

    }
    
  
}


