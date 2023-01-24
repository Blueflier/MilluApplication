//
//  loginViewController.swift
//  MilluApplication
//
//  Created by Joseph Hartono on 10/1/22.
//

import SwiftUI

class loginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //logo at top of screen
    var logo: UIImageView {
        let temp = UIImageView(image: UIImage(named: "solidLogo"))
        temp.frame.origin = CGPoint(x: 0, y: 0)
        temp.frame = CGRect(x: UIScreen.main.bounds.width/2-150, y: 100, width: 300, height: 150)
        return temp
    }
    
    //username text field
    var userName: UITextField {
        let temp = UITextField()
        temp.placeholder = "Username"
        temp.frame = CGRect(x: UIScreen.main.bounds.width/2-150, y: 300, width: 300, height: 30)
        temp.textAlignment = .center
        temp.borderStyle = UITextField.BorderStyle.roundedRect
        temp.autocapitalizationType = .none
        temp.autocorrectionType = .no
        
        return temp;
    }
    
    //password text field
    var password: UITextField {
        let temp = UITextField()
        temp.placeholder = "Password"
        temp.frame = CGRect(x: UIScreen.main.bounds.width/2-150, y: 340, width: 300, height: 30)
        temp.textAlignment = .center
        temp.isSecureTextEntry = true
        temp.autocapitalizationType = .none
        temp.autocorrectionType = .no
        temp.borderStyle = UITextField.BorderStyle.roundedRect
        
        return temp;
    }
    
   
    

    override func viewDidAppear(_ animated: Bool) {
        view.addSubview(logo)
        view.addSubview(userName)
        view.addSubview(password)
    }
}
