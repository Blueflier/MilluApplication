//
//  loginViewController.swift
//  MilluApplication
//
//  Created by Joseph Hartono on 10/1/22.
//

import SwiftUI
import FirebaseDatabase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class loginViewController: UIViewController {
    
    //FirebaseApp.configure()
    
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
    
    var loginButton: UIButton {
        let btn = UIButton()
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        btn.backgroundColor = UIColor.blue
        btn.setTitle("Test Button", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return btn
    }

//    var ref: DatabaseReference!

    var ref = Database.database().reference()
    
    @objc func buttonAction(sender: UIButton!) {
        
//        if(success()){
            self.performSegue(withIdentifier: "loginSuccessful", sender: nil)

//        }
//        else{
//
//        }
        print("Button tapped")
    }
    
   
    

    override func viewDidAppear(_ animated: Bool) {
        view.addSubview(logo)
        view.addSubview(userName)
        view.addSubview(password)
        self.view.addSubview(loginButton)

    }
}
