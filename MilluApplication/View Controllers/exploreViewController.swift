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
    
    var recommendedTitle: UILabel = {
        var temp = UILabel(frame: CGRect(x: 30, y: 25, width: 250, height: 100))
        temp.text = "Recommended"
        temp.font = UIFont(name: "Jost-Medium", size: 25)
        return temp
    }()
    
    var recommendedHeading: UILabel = {
        var temp = UILabel(frame: CGRect(x: 30, y: 50, width: 250, height: 100))
        temp.text = "Cards tailored to your child"
        temp.font = UIFont(name: "Jost-Regular", size: 17)
        return temp
    }()
    
    var recommendedScrollView: UIScrollView = {
        var temp = UIScrollView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor(named: "backgroundColor")
        temp.showsHorizontalScrollIndicator = false
        return temp
    }()
    
    var recommendedScrollContainer: UIScrollView = {
        var temp = UIScrollView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor(named: "backgroundColor")
        return temp
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // these will need to be actual data, but for now I just made a bunch haha
    let reccommended1 = questionCardView(frame: CGRect(x: 20, y: 20, width: 200, height: 300))
    let reccommended2 = questionCardView(frame: CGRect(x: 230, y: 20, width: 200, height: 300))
    let reccommended3 = questionCardView(frame: CGRect(x: 440, y: 20, width: 200, height: 300))
    let reccommended4 = questionCardView(frame: CGRect(x: 650, y: 20, width: 200, height: 300))
    let reccommended5 = questionCardView(frame: CGRect(x: 860, y: 20, width: 200, height: 300))
    let reccommended6 = questionCardView(frame: CGRect(x: 1070, y: 20, width: 200, height: 300))
    let reccommended7 = questionCardView(frame: CGRect(x: 1280, y: 20, width: 200, height: 300))
    
    override func viewDidAppear(_ animated: Bool) {
        
        scrollView.backgroundColor = UIColor(named: "backgroundColor")
        view.backgroundColor = UIColor(named: "backgroundColor")
        scrollView.addSubview(recommendedTitle)
        scrollView.addSubview(recommendedHeading)
        
        scrollView.addSubview(recommendedScrollView)
        recommendedScrollView.addSubview(recommendedScrollContainer)
        
        
        
        // make the constraints for horizontal recommended scrollView
        NSLayoutConstraint.activate([
            recommendedScrollView.topAnchor.constraint(equalTo: recommendedTitle.bottomAnchor),
            recommendedScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recommendedScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recommendedScrollView.heightAnchor.constraint(equalToConstant: 350)   // height of horizontal scroll
        ])
        
        let scrollContentGuide = recommendedScrollView.contentLayoutGuide
        let scrollFrameGuide = recommendedScrollView.frameLayoutGuide
        
        // constraints for the horizontal recommended scroll view container
        NSLayoutConstraint.activate([
            recommendedScrollContainer.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            recommendedScrollContainer.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            recommendedScrollContainer.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            recommendedScrollContainer.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),
            
            recommendedScrollContainer.topAnchor.constraint(equalTo: scrollFrameGuide.topAnchor),
            recommendedScrollContainer.bottomAnchor.constraint(equalTo: scrollFrameGuide.bottomAnchor),
            recommendedScrollContainer.widthAnchor.constraint(equalToConstant: 1490)   // width of horizontal scroll
        ])
        
        
        
        // temp subs
        recommendedScrollContainer.addSubview(reccommended1)
        recommendedScrollContainer.addSubview(reccommended2)
        recommendedScrollContainer.addSubview(reccommended3)
        recommendedScrollContainer.addSubview(reccommended4)
        recommendedScrollContainer.addSubview(reccommended5)
        recommendedScrollContainer.addSubview(reccommended6)
        recommendedScrollContainer.addSubview(reccommended7)

    }
    
   
}
