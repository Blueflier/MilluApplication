//
//  questionCard.swift
//  MilluApplication
//
//  Created by Ellieanna Ross on 9/9/22.
//

import Foundation

//questionCard which inherits from templateCard
class questionCard: templateCard {
    var age: Int                //reccomended age
    var devTags: Array<String>  //such as popular, featured, reccomended, qotd, etc.
    
    override init() {
        age = 4
        devTags = []
    }
    
    
}
