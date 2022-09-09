//
//  cardPage.swift
//  MilluApplication
//
//  Created by Ellieanna Ross on 9/9/22.
//

import Foundation

//card page which inherits from question card
class cardPage:questionCard {
    var doneCount: Int          //total people who've done this
    var doneToggle: Bool        //true = done, false = not done
    var encouragement: String   //string from content creators
    var guidance: String        //string from content creators
    
    
    override init() {       //not sure how this should look
        doneCount = 0
        doneToggle = false
        encouragement = ""
        guidance = ""
    }
}
