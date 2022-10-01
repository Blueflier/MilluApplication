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
    var usernameLabel : UILabel = UILabel(frame: CGRect(x: 30, y: 35, width: 200, height: 100))
    let qotdCard = qotdView(frame: CGRect(x: 27, y: 115, width: 350, height: 164))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //connect to database
        let ref = Database.database() . reference()
        ref.child("someid/name").setValue("Mike")
    }
    
    override func viewDidAppear( _ animated: Bool) {
        
        welcomeLabel.text = "Good Morning"
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        //Added qotd card
        scrollView.addSubview(qotdCard)
        
        //Added welcome labels
        addWelcomeLabels()
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
        
        welcomeLabel.font = UIFont(name: "Menlo", size: 15)
        //add welcome label subview
        scrollView.addSubview(welcomeLabel)
        
        //Add username label subview
        usernameLabel.text = "Ellieanna R."
        usernameLabel.font = UIFont(name: "HelveticaNeue-bold", size: 25)
        scrollView.addSubview(usernameLabel)
        
        
        
    }
    
}
    
