//
//  FriendsViewController.swift
//  U·N·I
//
//  Created by Luke Menzel on 14/05/2018.
//  Copyright © 2018 Luke Menzel. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, FBSDKLoginButtonDelegate{
    
    var dict : [String : AnyObject]!

    //facebook
    let manager = FBSDKLoginManager()
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        loginButton.center = CGPoint(x: 94, y: 40)
        loginButton.delegate = self
        
        if let token = FBSDKAccessToken.current(){
            fetchProfile() 
        }

        // Do any additional setup after loading the view.
    }
    
    //fetches users data
    func fetchProfile() {
        print("fetch profile")
        
        manager.loginBehavior = FBSDKLoginBehavior.web
        
        let graphRequest:FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"first_name, gender, last_name, email, picture.type(large)"])
        
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                print("Error: \(error)")
            }
            else
            {
                let data:[String:AnyObject] = result as! [String : AnyObject]
                print(data["first_name"]!)
                print(data["last_name"]!)
                print(data["email"]!)
                print(data["id"]!)
                print(data["gender"]!)
            }
        })
    }
    


    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("completed login")
        fetchProfile()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User has logged out")
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
}
