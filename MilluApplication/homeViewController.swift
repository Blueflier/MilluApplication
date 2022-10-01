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

    @IBOutlet weak var qotdView: UIView!
    
    var welcomeLabel : UILabel = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 100))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database() . reference()
        ref.child("someid/name").setValue("Mike")
    }
    
    override func viewDidAppear( _ animated: Bool) {
        welcomeLabel.text = "Good Morning"
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
}
    
