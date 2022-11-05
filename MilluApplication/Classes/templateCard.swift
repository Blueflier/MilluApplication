//
//  templateCard.swift
//  MilluApplication
//
//  Created by Ellieanna Ross on 9/9/22.
//

import Foundation
import UIKit

//parent for all cards
class templateCard {
    
    var picture: UIImage        //stores the background photo
    var title: String           //Stores the title, such as QOTD, Activity, etc.
    var question: String        //The question in the card
    var liked: Bool             //True = liked, false = not liked
    var tags: Array<String>     //all the tags for this card
    var devDate: Date           //hidden date that is for devs when sorting
    var devAge: Int     //int for reccomended age
    
    init() {
        picture = UIImage(named: "test")!   //not a real image yet <----- need to fix this
        title = ""                          //initializes to no title
        question = ""                       //initializes to no question
        liked = false                       //initializes to not liked
        tags = []                           //initializes to no tags
        devDate = Date.now                  //initializes to present date
        devAge = 4                          //initializes to ages 4+
        
    }
    
    
    
}
