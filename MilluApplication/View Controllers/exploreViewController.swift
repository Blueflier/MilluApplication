//
//  exploreViewController.swift
//  MilluApplication
//
//  Created by Ellieanna Ross on 10/1/22.
//

import Foundation
import UIKit
import FirebaseDatabase

class exploreViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIView!
    
    var reccommendedViewBack : UIScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 400, height: 650))
    var reccomendedView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 1200, height: 250))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    let reccomended1 = questionCardView(frame: CGRect(x: 20, y: 20, width: 150, height: 200))

    
    override func viewDidAppear(_ animated: Bool) {
        
        reccomendedView.backgroundColor = UIColor(named: "backgroundColor")
        
       
        
        reccommendedViewBack.addSubview(reccomendedView)
        scrollView.addSubview(reccommendedViewBack)
        
        reccomendedView.addSubview(reccomended1)

    }
    
   
}
