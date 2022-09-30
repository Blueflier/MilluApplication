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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear( _ animated: Bool) {
        qotdView.layer.cornerRadius = 5
        
    }
    
}
    
