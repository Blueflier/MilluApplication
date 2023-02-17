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
        let w = 200;
        let h = 50;
        let btn = UIButton()
        

        
        btn.frame = CGRect(
            x: Int(UIScreen.main.bounds.width)/2-100,
            y: 450,
            width: w, height: h)
        //btn.size = CGSizeMake(150, 70);

        btn.backgroundColor = UIColor.blue
        btn.setTitle("Play", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return btn
        //CGRect(x: self.view.frame.size.width/2 - button.frame.size.width/2, y: self.view.frame.size.height/2 - button.frame.size.height/2, width: button.frame.width, height: button.frame.height)
    }
    var createAccountButton: UIButton {

        let btn = UIButton()
        

        
        btn.setTitleColor(.blue, for: .normal)


        btn.setTitle("create account", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return btn
//        CGRect(x: self.view.frame.size.width/2 - button.frame.size.width/2, y: self.view.frame.size.height/2 - button.frame.size.height/2, width: button.frame.width, height: button.frame.height)
    }
    
    

//    var ref: DatabaseReference!

    //var ref = Database.database().reference()
    
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
        self.view.addSubview(createAccountButton)

    }
}
