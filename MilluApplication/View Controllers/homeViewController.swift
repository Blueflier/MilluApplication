//
//  homeViewController.swift
//  MilluApplication
//
//  Created by Ellieanna Ross on 9/30/22.
//

import Foundation
import UIKit
import FirebaseDatabase


class homeViewController: UIViewController, UIScrollViewDelegate{
    
    //the scrolling subview
    @IBOutlet weak var scrollView: UIView!
    
    //subviews to add
    var welcomeLabel : UILabel = UILabel(frame: CGRect(x: 30, y: 15, width: 200, height: 100))
    var usernameLabel : UILabel = UILabel(frame: CGRect(x: 30, y: 35, width: 300, height: 100))
    //let qotdCard = qotdView(frame: CGRect(x: UIScreen.main.bounds.size.width / 2 - 175, y: 115, width: 350, height: 164))
    let activityCard1 = activityCardView(frame: CGRect(x: UIScreen.main.bounds.size.width / 2 - 175, y: 350, width: 350, height: 80))
    let activityCard2 = activityCardView(frame: CGRect(x: UIScreen.main.bounds.size.width / 2 - 175, y: 450, width: 350, height: 80))
    let activityCard3 = activityCardView(frame: CGRect(x: UIScreen.main.bounds.size.width / 2 - 175, y: 550, width: 350, height: 80))
    var activitiesHeader : UILabel = UILabel(frame: CGRect(x: 30, y: 275, width: 250, height: 100))
    var calendarHeader : UILabel = UILabel(frame: CGRect(x: 30, y: 630, width: 250, height: 100))
    var calendarDisplay = calendarView(frame: CGRect(x: UIScreen.main.bounds.size.width / 2 - 175, y: 700, width: 350, height: 300))
    
    let qotdScrollView = UIScrollView()
    let pageControl = UIPageControl()
    var slides:[qotdView] = []
    
    //When view loads...
    override func viewDidLoad() {
        super.viewDidLoad()
        qotdScrollView.delegate = self
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        //connect to database
        //let ref = Database.database() . reference()
        //ref.child("someid/name").setValue("Mike")
    }
    
    
    
    //When view appears...
    override func viewDidAppear( _ animated: Bool) {
        
        //Set view bg color
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        
        
        //scrollView.addSubview(qotdCard)
        
        //Added welcome labels
        addWelcomeLabels()
        
        //setup qotd scroll view
       
        setupQOTDCarousel()
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        
        pageControl.backgroundColor = UIColor.orange
        pageControl.pageIndicatorTintColor = UIColor.blue
        scrollView.addSubview(pageControl)
        scrollView.bringSubviewToFront(pageControl)
        
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
    
    
    
    // constraints for qotd carousel
    func setupQOTDCarousel(){
        qotdScrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(qotdScrollView)
        qotdScrollView.backgroundColor = UIColor(named: "backgroundColor")
        qotdScrollView.frame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 175, y: 115, width: 350, height: 164)
        qotdScrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        qotdScrollView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        qotdScrollView.heightAnchor.constraint(equalToConstant: 164).isActive = true
        
    }
    
   
    
    func createSlides() -> [qotdView] {
        
        var qotdView1 = qotdView(frame: CGRect(x: UIScreen.main.bounds.size.width / 2 - 175, y: 115, width: 200, height: 164))
        qotdView1.title.text = "TITLE 1"
        var qotdView2 = qotdView(frame: CGRect(x: UIScreen.main.bounds.size.width / 2 - 175, y: 115, width: 350, height: 164))
        qotdView2.title.text = "TITLE 2"
        var qotdView3 = qotdView(frame: CGRect(x: UIScreen.main.bounds.size.width / 2 - 175, y: 115, width: 350, height: 164))
        qotdView3.title.text = "TITLE 3"
        qotdView1.layer.cornerRadius = qotdView1.frame.size.width * 0.1
        qotdView1.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        qotdView2.layer.cornerRadius = qotdView1.frame.size.width * 0.1
        qotdView2.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        qotdView3.layer.cornerRadius = qotdView1.frame.size.width * 0.1
        qotdView3.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        return [qotdView1, qotdView2, qotdView3]
    }
    
    func setupSlideScrollView(slides : [qotdView]) {
        qotdScrollView.contentSize = CGSize(width: 350 * CGFloat(slides.count), height: 164)
        qotdScrollView.isPagingEnabled = true
            
            for i in 0 ..< slides.count {
                slides[i].frame = CGRect(x: 350 * CGFloat(i), y: 0, width: 350, height: view.frame.height)
                qotdScrollView.addSubview(slides[i])
                print("added \(slides[i].title)")
            }
        }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("SCROLLED")
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        print("page ind \(pageIndex)")
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
    }

    
}
    

