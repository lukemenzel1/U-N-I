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

class FriendsViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    
    
    
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["public_profile", "email",]
        return button
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        loginButton.center = CGPoint(x: 92, y: 35)
        loginButton.delegate = self
        
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

