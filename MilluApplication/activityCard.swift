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
