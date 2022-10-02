//
//  ViewController.swift
//  Millu
//
//  Created by Joseph Hartono on 7/9/22.
//

import UIKit
import AVKit
import AVFoundation
import NotificationCenter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let ref = Database.database() . reference()
//        ref.child("someid/name").setValue("Mike")
        
        
    }
//        // Do any additional setup after loading the view.
//
//        //test comment - ellieanna
//
//        // Step 1: Ask for permission
//        let center = UNUserNotificationCenter.current()
//
//        center.requestAuthorization (options: [.alert, .sound])
//        { (granted, error) in
//        }
//
//        // Step 2: Create the notification content
//        let content = UNMutableNotificationContent()
//        content.title = "Reminder!"
//        content.body = "Ask your child the question of the day!"
//        // Step 3: Create the notification trigger
//        let date = Date().addingTimeInterval (10)
//        let dateComponents = Calendar.current.dateComponents([.year, .month, .day,.hour, .minute, .second], from: date)
//        let trigger = UNCalendarNotificationTrigger(dateMatching:
//        dateComponents, repeats: false)
//
//        // Step 4: Create the request
//        let uuidString = UUID().uuidString
//        let request = UNNotificationRequest(identifier:
//        uuidString, content: content, trigger: trigger)
//        // Step 5: Register the request
//        center.add(request) { (error) in
//        // Check the error parameter and handle any errors
    
        
    
    //play the Millu logo <------------------ need one with new aspect ratio
    override func viewDidAppear( _ animated: Bool) {
        let loggedIn = false;
        super.viewDidAppear(animated)
        
        self.view.backgroundColor = UIColor(named: "videoBgColor")
        
        let player=AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "milluLogo", ofType: ".m4v")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.frame = CGRect(x: 0-view.bounds.width/2, y: 0-view.bounds.height/2, width: view.bounds.width*2, height: view.bounds.height*2)
        
        layer.videoGravity = .resizeAspect
        view.layer.addSublayer(layer)
        player.volume = 0
        player.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            if(loggedIn){
                self.performSegue(withIdentifier: "finishedPlayingVideo", sender: nil)
            }
            else{
                self.performSegue(withIdentifier: "toLogin", sender: nil)
            }
        }
        
    }
}
    
