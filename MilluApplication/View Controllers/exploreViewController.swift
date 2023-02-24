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
    
    
    // recommended section ------------------------------------------------------------------------------
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
    
    // most popular section ------------------------------------------------------------------------------
    var popularTitle: UILabel = {
        var temp = UILabel(frame: CGRect(x: 30, y: 450, width: 250, height: 100))
        temp.text = "Most Popular"
        temp.font = UIFont(name: "Jost-Medium", size: 25)
        return temp
    }()
    
    var popularHeading: UILabel = {
        var temp = UILabel(frame: CGRect(x: 30, y: 475, width: 300, height: 100))
        temp.numberOfLines = 2
        temp.text = "What other families are talking about"
        temp.font = UIFont(name: "Jost-Regular", size: 17)
        return temp
    }()
    
    var popularScrollView: UIScrollView = {
        var temp = UIScrollView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor(named: "backgroundColor")
        temp.showsHorizontalScrollIndicator = false
        return temp
    }()
    
    var popularScrollContainer: UIScrollView = {
        var temp = UIScrollView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor(named: "backgroundColor")
        return temp
    }()
    
    // new to millu section ------------------------------------------------------------------------------
    var newTitle: UILabel = {
        var temp = UILabel(frame: CGRect(x: 30, y: 875, width: 250, height: 100))
        temp.text = "New to MILLU"
        temp.font = UIFont(name: "Jost-Medium", size: 25)
        return temp
    }()
    
    var newHeading: UILabel = {
        var temp = UILabel(frame: CGRect(x: 30, y: 900, width: 300, height: 100))
        temp.numberOfLines = 2
        temp.text = "From our MILLU Community"
        temp.font = UIFont(name: "Jost-Regular", size: 17)
        return temp
    }()
    
    var newScrollView: UIScrollView = {
        var temp = UIScrollView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = UIColor(named: "backgroundColor")
        temp.showsHorizontalScrollIndicator = false
        return temp
    }()
    
    var newScrollContainer: UIScrollView = {
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
    
    let reccommended4 = questionCardView(frame: CGRect(x: 20, y: 20, width: 200, height: 300))
    let reccommended5 = questionCardView(frame: CGRect(x: 230, y: 20, width: 200, height: 300))
    let reccommended6 = questionCardView(frame: CGRect(x: 440, y: 20, width: 200, height: 300))
    
    let reccommended7 = questionCardView(frame: CGRect(x: 20, y: 20, width: 200, height: 300))
    let reccommended8 = questionCardView(frame: CGRect(x: 230, y: 20, width: 200, height: 300))
    let reccommended9 = questionCardView(frame: CGRect(x: 440, y: 20, width: 200, height: 300))
    
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
            recommendedScrollContainer.widthAnchor.constraint(equalToConstant: 650)   // width of horizontal scroll
        ])
        
        
        
        // temp subs
        recommendedScrollContainer.addSubview(reccommended1)
        reccommended1.image.image = UIImage(named: "clothes")
        reccommended2.questionLabel.text = "What's one of your favorite meals and why?"
        reccommended3.questionLabel.text = "What's one thing you really enjoy about yourself?"
        reccommended2.image.image = UIImage(named: "food")
        reccommended3.image.image = UIImage(named: "celebrate")
        reccommended2.titleLabel.text = "Meals"
        reccommended3.titleLabel.text = "Positivity"
        recommendedScrollContainer.addSubview(reccommended2)
        recommendedScrollContainer.addSubview(reccommended3)
       
        
        // popular subheadings
        scrollView.addSubview(popularTitle)
        scrollView.addSubview(popularHeading)
        
        // popular scroll views
        scrollView.addSubview(popularScrollView)
        popularScrollView.addSubview(popularScrollContainer)
        
        
        
        // make the constraints for horizontal recommended scrollView
        NSLayoutConstraint.activate([
            popularScrollView.topAnchor.constraint(equalTo: popularTitle.bottomAnchor),
            popularScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            popularScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            popularScrollView.heightAnchor.constraint(equalToConstant: 350)   // height of horizontal scroll
        ])
        
        let popularScrollContentGuide = popularScrollView.contentLayoutGuide
        let popularScrollFrameGuide = popularScrollView.frameLayoutGuide
        
        // constraints for the horizontal recommended scroll view container
        NSLayoutConstraint.activate([
            popularScrollContainer.topAnchor.constraint(equalTo: popularScrollContentGuide.topAnchor),
            popularScrollContainer.leadingAnchor.constraint(equalTo: popularScrollContentGuide.leadingAnchor),
            popularScrollContainer.trailingAnchor.constraint(equalTo: popularScrollContentGuide.trailingAnchor),
            popularScrollContainer.bottomAnchor.constraint(equalTo: popularScrollContentGuide.bottomAnchor),
            
            popularScrollContainer.topAnchor.constraint(equalTo: popularScrollFrameGuide.topAnchor),
            popularScrollContainer.bottomAnchor.constraint(equalTo: popularScrollFrameGuide.bottomAnchor),
            popularScrollContainer.widthAnchor.constraint(equalToConstant: 650)   // width of horizontal scroll
        ])
        
        // temp subs
        reccommended4.questionLabel.text = "If you could be a famous person for a week, who would you be and why?"
        reccommended5.questionLabel.text = "If you had one wish (and you can’t wish for more wishes), what would you wish for and why?"
        reccommended6.questionLabel.text = "What's one new thing you learned today"
        reccommended4.image.image = UIImage(named: "famous")
        reccommended5.image.image = UIImage(named: "wishing")
        reccommended6.image.image = UIImage(named: "learning")
        reccommended4.titleLabel.text = "Role Models"
        reccommended5.titleLabel.text = "Wants and Needs"
        reccommended6.titleLabel.text = "Learning"
        
        popularScrollContainer.addSubview(reccommended4)
        popularScrollContainer.addSubview(reccommended5)
        popularScrollContainer.addSubview(reccommended6)

        // new subheadings
        scrollView.addSubview(newTitle)
        scrollView.addSubview(newHeading)
        
        // new scroll views
        scrollView.addSubview(newScrollView)
        newScrollView.addSubview(newScrollContainer)
        
        // make the constraints for horizontal new scrollView
        NSLayoutConstraint.activate([
            newScrollView.topAnchor.constraint(equalTo: newTitle.bottomAnchor),
            newScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newScrollView.heightAnchor.constraint(equalToConstant: 350)   // height of horizontal scroll
        ])
        
        let newScrollContentGuide = newScrollView.contentLayoutGuide
        let newScrollFrameGuide = newScrollView.frameLayoutGuide
        
        // constraints for the horizontal recommended scroll view container
        NSLayoutConstraint.activate([
            newScrollContainer.topAnchor.constraint(equalTo: newScrollContentGuide.topAnchor),
            newScrollContainer.leadingAnchor.constraint(equalTo: newScrollContentGuide.leadingAnchor),
            newScrollContainer.trailingAnchor.constraint(equalTo: newScrollContentGuide.trailingAnchor),
            newScrollContainer.bottomAnchor.constraint(equalTo: newScrollContentGuide.bottomAnchor),
            
            newScrollContainer.topAnchor.constraint(equalTo: newScrollFrameGuide.topAnchor),
            newScrollContainer.bottomAnchor.constraint(equalTo: newScrollFrameGuide.bottomAnchor),
            newScrollContainer.widthAnchor.constraint(equalToConstant: 650)   // width of horizontal scroll
        ])
        
        // temp subs
        reccommended7.questionLabel.text = "Take 3 deep breathes, How do I feel right now? Does any part of my body feel heavy? Why?"
        reccommended8.questionLabel.text = "What is one activity you think that gives you energy and joy? How often do you do it? "
        reccommended9.questionLabel.text = "What one thing I want to grow in this year? Or month? Who can I ask for help?"
        reccommended7.image.image = UIImage(named: "peaceful")
        reccommended8.image.image = UIImage(named: "activity")
        reccommended9.image.image = UIImage(named: "planning")
        reccommended7.titleLabel.text = "Self Awareness"
        reccommended8.titleLabel.text = "Movement & Activity"
        reccommended9.titleLabel.text = "Growth"
        newScrollContainer.addSubview(reccommended7)
        newScrollContainer.addSubview(reccommended8)
        newScrollContainer.addSubview(reccommended9)
        
    }
    
   
}
