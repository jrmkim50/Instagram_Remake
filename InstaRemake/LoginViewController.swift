//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Jeremy Kim on 7/10/17.
//  Copyright © 2017 Jeremy Kim All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User
class LoginViewController : UIViewController{
    let user: FIRUser? = Auth.auth().currentUser
    
    @IBOutlet weak var loginButton: UIButton!
    // MARK: - IBActions
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // 1
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        // 2
        authUI.delegate = self
        
        // 3
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
}
extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
        }
        
        // 1
        guard let user = user
            else { return }
        
        // 2
        //        let userRef = Database.database().reference().child("users").child(user.uid)
        
        // 3
        //        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
        //            // 4 retrieve user data from snapshot
        //        })
        //        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
        //            if let user = User(snapshot: snapshot) {
        //                print("Welcome back, \(user.username).")
        //            } else {
        //                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
        //            }
        //        })
        //        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
        //            if let _ = User(snapshot: snapshot) {
        //                let storyboard = UIStoryboard(name: "Main", bundle: .main)
        //
        //                if let initialViewController = storyboard.instantiateInitialViewController() {
        //                    self.view.window?.rootViewController = initialViewController
        //                    self.view.window?.makeKeyAndVisible()
        //                }
        //            } else {
        //                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
        //            }
        //        })
        
        
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                // handle existing user
                User.setCurrent(user, writeToUserDefaults: true)
                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            } else {
                // handle new user
                self.performSegue(withIdentifier: Constants.segue.toCreateUsername, sender: self)
            }
        }
    }
}
