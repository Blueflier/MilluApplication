//
//  qotdCard.swift
//  MilluApplication
//
//  Created by Ellieanna Ross on 9/9/22.
//

import Foundation
import UIKit
import Firebase

//questionOfTheDay card which inherrits from templateCard


class questionOfTheDay: templateCard {
    var publicDate: Date
    
    
    override init() {       //not sure if this is how this should look
        publicDate = Date.now
    }
}


class qotdView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
      
      //initWithCode to init view from xib or storyboard
      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
      }
    
    //Realtime Database stuff
    var ref: DatabaseReference!

    
    //subviews to add
    var imgView : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 126, height: 164))
    var title : UILabel = UILabel(frame: CGRect(x: 140, y: 10, width: 200, height: 15))
    var question : UILabel = UILabel(frame: CGRect(x: 140, y: 30, width: 200, height: 91))
    var likeButton : UIButton = UIButton(frame: CGRect(x: 130, y: 120, width: 31, height: 34))
    
    
      //common func to init our view
      private func setupView() {
          
          //firebase database connection
          let ref = Database.database().reference()
          
          
          //get date
          var date = Date().formatted(date: .numeric, time: .omitted)
          let remove: Set<Character> = ["/"]
          date.removeAll(where: { remove.contains($0) })
          
          //I AM HERE - I NEED TO KEEP WORKING ON PULLING THE DATA
          //I don't know how to pull it to here
          
          
          
          
          //View configuration
          backgroundColor = .white
          layer.cornerRadius = 13
          layer.shadowColor = UIColor.black.cgColor
          layer.shadowOpacity = 0.1
          layer.shadowOffset = CGSize(width: -1, height: 1)
          layer.shadowRadius = 10
        
          //Image view subview
          imgView.image = UIImage(named: "placeholderImage")
          imgView.layoutIfNeeded()
          imgView.layer.cornerRadius = imgView.frame.size.width * 0.1
          imgView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
          imgView.clipsToBounds = true
          addSubview(imgView)
          
          //Title subview
          addSubview(title)
          title.text = "Question of the Day | September 25th"
          title.adjustsFontSizeToFitWidth = true
          title.textColor = UIColor(named: "lightTextColor")
          title.font = UIFont(name: "Jost-Regular", size: 10)
          
          //Question Subview
          addSubview(question)
          question.text = "If you had to cross a river, how would you do it?"
          question.numberOfLines = 3
          question.font = UIFont(name: "Jost-Regular", size: 20)
          question.adjustsFontSizeToFitWidth = true
          
          
          //Like Button Subview
          likeButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
          likeButton.tintColor = UIColor(named: "lightTextColor")
          addSubview(likeButton)
          
      }
    
    
}
