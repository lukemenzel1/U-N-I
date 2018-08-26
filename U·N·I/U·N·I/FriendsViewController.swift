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

class FriendsViewController: UIViewController {
    
    
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        loginButton.center = CGPoint(x: 92, y: 35)
        
    }
    
}

