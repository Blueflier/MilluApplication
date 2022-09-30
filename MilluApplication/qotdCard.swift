//
//  qotdCard.swift
//  MilluApplication
//
//  Created by Ellieanna Ross on 9/9/22.
//

import Foundation
import UIKit

//questionOfTheDay card which inherrits from templateCard


class questionOfTheDay: templateCard {
    var publicDate: Date
    
    
    override init() {       //not sure if this is how this should look
        publicDate = Date.now
    }
}


class qotdView: UIView {

      
      //initWithCode to init view from xib or storyboard
      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
      }
      
    var imgView : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 126, height: 164))
    var title : UILabel = UILabel(frame: CGRect(x: 130, y: 10, width: 256, height: 15))
    var question : UILabel = UILabel(frame: CGRect(x: 130, y: 30, width: 256, height: 91))
    var likeButton : UIButton = UIButton(frame: CGRect(x: 130, y: 130, width: 31, height: 34))
    
    
      //common func to init our view
      private func setupView() {
          backgroundColor = .white
          isOpaque = false
          layer.cornerRadius = 3
          addSubview(imgView)
          imgView.image = UIImage(named: "placeholderImage")
          imgView.layoutIfNeeded()
          imgView.layer.cornerRadius = imgView.frame.size.width * 0.25
          imgView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
          imgView.clipsToBounds = true
          
          addSubview(title)
          title.text = "Question of the Day | September 25th"
          title.adjustsFontSizeToFitWidth = true
          
          addSubview(question)
          question.text = "If you had to cross a river, how would you do it?"
          question.numberOfLines = 3
          question.font = question.font.withSize(23)
          question.adjustsFontSizeToFitWidth = true
          addSubview(likeButton)
          likeButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)

          
      }
    
    
}
