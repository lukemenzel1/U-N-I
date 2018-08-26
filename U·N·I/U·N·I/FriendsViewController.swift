//
//  FriendsViewController.swift
//  U·N·I
//
//  Created by Luke Menzel on 14/05/2018.
//  Copyright © 2018 Luke Menzel. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn

class FriendsViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    
    //facebook login button
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["public_profile", "email",]
        return button
    } ()
    
    //Google login button
//    let signInButton:  GIDSignInButton = {
//        let googleButton = GIDSignInButton()
//        return googleButton
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make facebook button appear on screen
        view.addSubview(loginButton)
        loginButton.center = CGPoint(x: 92, y: 35)
        loginButton.delegate = self
        
//        //make google button appear on screen
//        view.addSubview(signInButton)
//        signInButton.center = CGPoint(x: 200, y: 35)
//
        
        //checking current users login access token
        if let token = FBSDKAccessToken.current() {
            fetchProfile()
        }
        
    }
    
    func fetchProfile() {
        print("Fetch Profile")
        let parameters = ["fields": "email, first_name, last_name, id, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start { (connection, result, error) in
            if error != nil {
                print("Error: \(error)")
                return
            }
            if let userInfo = result as? [String: Any] {
                let email = userInfo["email"] as? String
                print(email!)
            }
            
            print(result!)
                
            }
        
        }
    
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("Did Login")
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }

}

