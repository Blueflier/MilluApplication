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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database() . reference()
        ref.child("someid/name").setValue("Mike")
    }
    
    override func viewDidAppear( _ animated: Bool) {
        //qotdView.layer.cornerRadius = 5
        
    }
    
}
    
