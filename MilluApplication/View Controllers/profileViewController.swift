//
//  profileViewController.swift
//  MilluApplication
//
//  Created by Ellieanna Ross on 5/17/23.
//

import Foundation
import UIKit
import FirebaseDatabase
import SwiftUI


class profileViewController: UIViewController {
    
    // Profile title
    var profileTitle: UILabel = {
        var temp = UILabel(frame: CGRect(x: UIScreen.main.bounds.size.width / 2 - 50, y: 40, width: 100, height: 100))
        
        temp.text = "Profile"
        temp.textAlignment = .center
        temp.font = UIFont(name: "Jost-Medium", size: 30)
        return temp
    }()
    
    func line(height: Double) -> UIView {
        let l = UIView(frame: CGRect(x: 0, y: height, width: UIScreen.main.bounds.size.width, height: 1))
        l.backgroundColor = UIColor.black
        
        return l
    }
    
    func sub(title: String, shape: String, height: Double) -> UIView {
        let likedView = UIView(frame: CGRect(x: 0.0, y: height, width: UIScreen.main.bounds.size.width, height: 50))
        likedView.backgroundColor = UIColor(named: "backgroundColor")
        
        let icon: UIImageView = UIImageView(frame: CGRect(x: 30, y: 25/2, width: 30, height: 30))
        icon.image = UIImage(systemName: "\(shape)")
        icon.preferredSymbolConfiguration = UIImage.SymbolConfiguration(weight: .ultraLight)
        icon.tintColor = UIColor.black
        
        let label = UILabel(frame: CGRect(x: 70, y: 25/2 + 5, width: 150, height: 20))
        label.text = title
        label.font = UIFont(name: "Jost-ExtraLight", size: 20)
        
        
        let arrow: UIImageView = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width - 50, y: 25/2, width: 15, height: 30))
        arrow.image = UIImage(systemName: "greaterthan")
        arrow.preferredSymbolConfiguration = UIImage.SymbolConfiguration(weight: .ultraLight)
        arrow.tintColor = UIColor.black
        
        likedView.addSubview(icon)
        likedView.addSubview(label)
        likedView.addSubview(arrow)
        return likedView

    }
    
    var logo: UIImageView {
        let temp: UIImageView = UIImageView(frame: CGRect(x: 15, y: 470, width: 100, height: 50))
        temp.image = UIImage(named: "solidLogo")
        return temp
    }
    
    var lbl: UILabel = {
        var temp = UILabel(frame: CGRect(x: 30, y: 510, width: 300, height: 50))
        temp.numberOfLines = 2
    
        temp.text = "Immersive quality time for families to play, heal, and grow together"
        temp.font = UIFont(name: "Jost-ExtraLight", size: 15)
        return temp
    }()
    
    var logOut: UIButton {
        let temp: UIButton = UIButton(frame: CGRect(x: 30, y: 565, width: UIScreen.main.bounds.size.width, height: 50))
        temp.contentHorizontalAlignment = .left
        temp.setTitleColor(UIColor(named: "blue"), for: .normal)
        temp.titleLabel?.font = UIFont(name: "Jost-Medium", size: 20)
        temp.setTitle("Log out", for: .normal)
        return temp
    }
    
    var searchBar: UISearchBar {
        var temp = UISearchBar(frame: CGRect(x: 5, y: 120, width: 380, height: 50))
        temp.backgroundColor = UIColor(named: "backgroundColor")
        temp.searchBarStyle = UISearchBar.Style.minimal
        
        return temp
    }
    
    // ------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewDidAppear( _ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(profileTitle)
        view.addSubview(line(height: 115))
        view.addSubview(searchBar)
        view.addSubview(sub(title: "Posts you've liked", shape: "heart", height: 170))
        view.addSubview(sub(title: "Account", shape: "person", height: 220))
        view.addSubview(sub(title: "Security", shape: "lock", height: 270))
        view.addSubview(sub(title: "Notifications", shape: "bell", height: 320))
        view.addSubview(sub(title: "Help", shape: "lifepreserver", height: 370))
        view.addSubview(sub(title: "About", shape: "info.circle", height: 420))
        view.addSubview(line(height: 470))
        view.addSubview(logo)
        view.addSubview(lbl)
        view.addSubview(line(height: 565))
        view.addSubview(logOut)
        view.addSubview(line(height: 620))
    }
    
    
    // hide keyboard when touched outside it
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
}
    
