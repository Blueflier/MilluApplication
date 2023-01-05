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
          
          
      //Months
      let months = ["1": "January",
                    "2": "Febrary",
                    "3": "March",
                    "4": "April",
                    "5": "May",
                    "6": "June",
                    "7": "July",
                    "8": "August",
                    "9": "September",
                    "10": "October",
                    "11": "November",
                    "12": "December"]
      //Days
      let days = ["01": "1st",
                  "02": "2nd",
                  "03": "3rd",
                  "04": "4th",
                  "05": "5th",
                  "06": "6th",
                  "07": "7th",
                  "08": "8th",
                  "09": "9th"]
         
          
          
          //firebase database connection
          let ref = Database.database().reference()
          
          
          //get date
          let date = Date().formatted(date: .numeric, time: .omitted)
          
          //get the day from string
          var start = date.index(date.startIndex, offsetBy: 3)
          var end = date.index(date.startIndex, offsetBy: 5)
          var range = start..<end
          var subDayPre = date[range]
          var subDay: String = ""
          
          // get month
          var subMonth = date.prefix(2)
          //check if month is less than 10 (i.e. only one digit
          if subMonth.contains("/") {
              subMonth = subMonth.dropLast(1)
              //get the day from string
               start = date.index(date.startIndex, offsetBy: 2)
               end = date.index(date.startIndex, offsetBy: 4)
               range = start..<end
               subDayPre = date[range]
               subDay = ""
          }
          
          
          // format the date using ordinal formatting
          if (days.contains{ $0.value == subDayPre }) {
              subDay = days[String(subDayPre)]!
          }
          
          switch (subDayPre) {
              case "21" , "31":
                    subDay = subDayPre + ("st")
              case "2" , "22":
                    subDay = subDayPre + ("nd")
              case "3" ,"23":
                    subDay = subDayPre + ("rd")
              default:
                    subDay = subDayPre + ("th")
            }
          
          // ensure date does not contain "/"
          if subDay.contains("/") {
              subDay = subDay.replacingOccurrences(of: "/", with: "")
          }
          
         
          //I AM HERE - I NEED TO KEEP WORKING ON PULLING THE DATA FOR THE QUESTION
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
          title.adjustsFontSizeToFitWidth = true
          title.textColor = UIColor(named: "lightTextColor")
          title.font = UIFont(name: "Jost-Regular", size: 10)
                    
          //Attributing title
          let boldAttribute = [ NSAttributedString.Key.font: UIFont(name: "Jost-Medium", size: 10)! ]
          let regularAttribute = [ NSAttributedString.Key.font: UIFont(name: "Jost-Regular", size: 10)! ]
          let regularText = NSAttributedString(string: "Question of the Day · ", attributes: regularAttribute)
          let boldText = NSAttributedString(string: String(months[String(subMonth)]!) + " " + subDay, attributes: boldAttribute)
          let newString = NSMutableAttributedString()
          newString.append(regularText)
          newString.append(boldText)
          
          //Display title attribute here
          title.attributedText = newString
          
          
          
          
          
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
