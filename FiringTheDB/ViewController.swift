//
//  ViewController.swift
//  FiringTheDB
//
//  Created by LokeshReddy Pothapu on 3/3/17.
//  Copyright © 2017 LokeshReddy Pothapu. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth


class ViewController: UIViewController,FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    
    /**
     Sent to the delegate when the button was used to logout.
     - Parameter loginButton: The button that was clicked.
     */
    public func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("user logged out")
    }

    /**
     Sent to the delegate when the button was used to logout.
     - Parameter loginButton: The button that was clicked.
     */
   
 var loginButton = FBSDKLoginButton()
    override func viewDidLoad() {
        super.viewDidLoad()
       
       // self.image
        
        //to check whether the user is signedin or not
        
        FIRAuth.auth()?.addStateDidChangeListener() { (auth, user) in
            
            self.loginButton.isHidden = true
            if user != nil {
                // User is signed in.
                // ...move to home screen
                
                let mainstoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                let homeViewController:UIViewController = mainstoryboard.instantiateViewController(withIdentifier: "HomeVC")
                self.present(homeViewController, animated: true, completion: nil)
                
            } else {
                // No user is signed in.
                // ...
                // Optional: Place the button in the center of your view.
                self.loginButton.center = self.view.center
                self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
                self.loginButton.delegate = self
                self.view.addSubview(self.loginButton)
                self.loginButton.isHidden = false
            }
        }
        
        
        
        
       
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        self.loginButton.isHidden = true
        activity.startAnimating()
        if (error != nil) {
            self.loginButton.isHidden = false
          activity.startAnimating()
        } else if(result.isCancelled){
            self.loginButton.isHidden = false
            print(error.localizedDescription)
            activity.stopAnimating()
        }
        
        else{
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            
            print("user logged into firebase app")
            //activityspinner.stopAnimating()
    }
        }
    }
//    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//       
//    }
//        
//         func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//            print("user logged out")
//        }

        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

