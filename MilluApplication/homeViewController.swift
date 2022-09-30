//
//  homeViewController.swift
//  MilluApplication
//
//  Created by Ellieanna Ross on 9/30/22.
//

import Foundation
import UIKit

class homeViewController: UIViewController {

    @IBOutlet weak var qotdView: UIView!
    
    var welcomeLabel : UILabel = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 100))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear( _ animated: Bool) {
        welcomeLabel.text = "Good Morning"
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
}
    
