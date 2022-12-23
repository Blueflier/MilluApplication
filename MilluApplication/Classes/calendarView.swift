//
//  calendarView.swift
//  MilluApplication
//
//  Created by Ellieanna Ross on 10/1/22.
//

import Foundation
import UIKit






class calendarView : UICalendarView {
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    

    
    private func setupView() {
        
        
        
        // calendar settings
        calendar = Calendar(identifier: .gregorian)
        fontDesign = .rounded
        tintColor = UIColor(named: "blue")
        availableDateRange = DateInterval(start: .distantPast, end: .distantFuture)
        
        //View configuration
        backgroundColor = .white
        layer.cornerRadius = 13
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 10
        
        
        
        
        
        
        
        backgroundColor = .white
        
    }
    
}
