//
//  homeViewController.swift
//  MilluApplication
//
//  Created by Ellieanna Ross on 9/30/22.
//

import Foundation
import UIKit
import FirebaseDatabase

class homeViewController: UIViewController {

    //the scrolling subview
    @IBOutlet weak var scrollView: UIView!
    
    //subviews to add
    var welcomeLabel : UILabel = UILabel(frame: CGRect(x: 30, y: 15, width: 200, height: 100))
    var usernameLabel : UILabel = UILabel(frame: CGRect(x: 30, y: 35, width: 300, height: 100))
    let qotdCard = qotdView(frame: CGRect(x: 27, y: 115, width: 350, height: 164))
    let activityCard1 = activityCardView(frame: CGRect(x: 27, y: 350, width: 350, height: 80))
    let activityCard2 = activityCardView(frame: CGRect(x: 27, y: 450, width: 350, height: 80))
    let activityCard3 = activityCardView(frame: CGRect(x: 27, y: 550, width: 350, height: 80))
    var activitiesHeader : UILabel = UILabel(frame: CGRect(x: 30, y: 275, width: 250, height: 100))
    var calendarHeader : UILabel = UILabel(frame: CGRect(x: 30, y: 630, width: 250, height: 100))
    var calendarDisplay = calendarView(frame: CGRect(x: 27, y: 700, width: 350, height: 300))
    
    //When view loads...
    override func viewDidLoad() {
        super.viewDidLoad()
        //connect to database
        let ref = Database.database() . reference()
        ref.child("someid/name").setValue("Mike")
    }
    
    
    
    //When view appears...
    override func viewDidAppear( _ animated: Bool) {
        
        //Set view gb color
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        //Added qotd card
        scrollView.addSubview(qotdCard)
        
        //Added welcome labels
        addWelcomeLabels()
        
        //Added activity cards
        scrollView.addSubview(activityCard1)
        activityCard1.activityType(type: "conversation", time: "10 am to 10:15 am")
        
        scrollView.addSubview(activityCard2)
        activityCard2.activityType(type: "activity", time: "4 pm to 4:15 pm")
        
        scrollView.addSubview(activityCard3)
        activityCard3.activityType(type: "storytime", time: "9 pm to 9:30 pm")
    }
    
    
    func addWelcomeLabels() {
        
        
        //get local time
        let hour  = (Calendar.current.component(.hour, from: Date()))
        if (hour < 12) {
            welcomeLabel.text = "Good Morning!"
        } else if (hour < 17) {
            welcomeLabel.text = "Good Afternoon!"
        } else {
            welcomeLabel.text = "Good Evening!"
        }
        
        //add welcome label subview
        welcomeLabel.font = UIFont(name: "Jost-Regular", size: 15)
        scrollView.addSubview(welcomeLabel)
        
        //Add username label subview
        usernameLabel.text = "Ellieanna R."
        usernameLabel.font = UIFont(name: "Jost-Medium", size: 25)
        scrollView.addSubview(usernameLabel)
        
        
        //add activities header
        activitiesHeader.text = "Today's Activities"
        activitiesHeader.font = UIFont(name: "Jost-Medium", size: 25)
        scrollView.addSubview(activitiesHeader)
        
        //add calendar header
        calendarHeader.text = "Your Calendar"
        calendarHeader.font = UIFont(name: "Jost-Medium", size: 25)
        scrollView.addSubview(calendarHeader)
        
        scrollView.addSubview(calendarDisplay)
        
    }
    
}
    
