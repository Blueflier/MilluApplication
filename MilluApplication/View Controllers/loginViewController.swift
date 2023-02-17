//

//  loginViewController.swift

//  MilluApplication

//

//  Created by Joseph Hartono on 10/1/22.

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

temp.frame = CGRect(x: UIScreen.main.bounds.width/2-150, y: 300, width: 300, height: 45)

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

temp.frame = CGRect(x: UIScreen.main.bounds.width/2-150, y: 350, width: 300, height: 45)

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

y: 525,

width: w, height: h)

btn.backgroundColor = UIColor(red: 70/255, green: 143/255, blue: 251/255, alpha: 1)

btn.setTitle("Play", for: .normal)

btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

btn.layer.cornerRadius = 8

return btn

}

var createAccountButton: UIButton {

let btn = UIButton()

btn.setTitleColor(UIColor(red: 70/255, green: 143/255, blue: 251/255, alpha: 1), for: .normal)

btn.setTitle("Create an Account", for: .normal)

//        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

btn.frame = CGRect(

x: Int(UIScreen.main.bounds.width)/2-200,

y: 575,

width: 400, height: 40)

return btn

}

//    var ref: DatabaseReference!

//var ref = Database.database().reference()

@objc func buttonAction(sender: UIButton!) {

var user: String = userName.text ?? ""

//        var pass: String = password.text ?? ""

if(user.isEmpty){

Text("error").padding()

}

//        if(success()){

self.performSegue(withIdentifier: "loginSuccessful", sender: nil)

//        }

//        else{

//

//        }

print("Button tapped")

}

override func viewDidAppear(_ animated: Bool) {

view.addSubview(logo)

view.addSubview(userName)

view.addSubview(password)

self.view.addSubview(loginButton)

self.view.addSubview(createAccountButton)

}

override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

self.view.endEditing(true);

}

}
