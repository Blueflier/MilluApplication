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


var ref: DatabaseReference!


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
    
    
    
    //subviews to add
    var imgView : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 126, height: 164))
    var title : UILabel = UILabel(frame: CGRect(x: 140, y: 10, width: 200, height: 15))
    var question : UILabel = UILabel(frame: CGRect(x: 140, y: 30, width: 200, height: 91))
    var likeButton : UIButton = UIButton(frame: CGRect(x: 130, y: 120, width: 31, height: 34))
    
    
      //common func to init our view
      private func setupView() {
          
          
          //Realtime Database stuff
          ref = Database.database().reference()
          
          
          
          
          
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
          
          
          // format the date using ordinal formatting
          var printDate = "\(DateFormatter().monthSymbols[Calendar.current.component(.month, from: Date()) - 1]) \(Calendar.current.component(.day, from: Date()))"
          if (Calendar.current.component(.day, from: Date()) % 10 == 1) {
              printDate += "st"
          } else if (Calendar.current.component(.day, from: Date()) % 10 == 2) {
              printDate += "nd"
          } else if (Calendar.current.component(.day, from: Date()) % 10 == 3){
              printDate += "rd"
          } else {
              printDate += "th"
          }
          
          
          
          //View configuration
          backgroundColor = .white
          layer.cornerRadius = 13
//          layer.shadowColor = UIColor.black.cgColor
//          layer.shadowOpacity = 0.1
//          layer.shadowOffset = CGSize(width: -1, height: 1)
//          layer.shadowRadius = 10
        
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
          let boldText = NSAttributedString(string: printDate, attributes: boldAttribute)
          let newString = NSMutableAttributedString()
          newString.append(regularText)
          newString.append(boldText)
          
          //Display title attribute here
          title.attributedText = newString
          
          
          
          
          
          //Question Subview
          addSubview(question)
          if (question.text == "") {
              question.text = "If you had to cross a river, how would you do it?"
          }
          question.numberOfLines = 3
          question.font = UIFont(name: "Jost-Regular", size: 20)
          question.adjustsFontSizeToFitWidth = true
          
          
          //Like Button Subview
          likeButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
          likeButton.tintColor = UIColor(named: "lightTextColor")
          addSubview(likeButton)
          
          
      }
    
    // get question of the day ids
    func getInfoFromId(id: String) async -> Question {

        var temp: Question = Question(question: "", title: "", likeCount: 0, devDate: "", publicDate: "", publicAge: 0, time: "", devTags: [], publicTags: [])
        ref.child("Questions/\(id)").getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }
         temp = Question(question: snapshot?.value(forKey: "Question") as! String, title: snapshot?.value(forKey: "Title") as! String, likeCount: snapshot?.value(forKey: "LikeCount") as! Int, devDate: snapshot?.value(forKey: "DevDate") as! String, publicDate: snapshot?.value(forKey: "PublicDate") as! String, publicAge: snapshot?.value(forKey: "PublicAge") as! Int, time: snapshot?.value(forKey: "Time") as! String, devTags: snapshot?.value(forKey: "DevTags") as! [String], publicTags: snapshot?.value(forKey: "PublicTags") as! [String])
            //temp.question = snapshot?.value(forKey: "Question") as! String
            
        });
        return temp
    }
    
    
}
