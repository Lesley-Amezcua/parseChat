//
//  ViewController.swift
//  parseChat
//
//  Created by lesley amezcua on 3/7/18.
//  Copyright © 2018 lesley amezcua. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var activityIndi: UIActivityIndicatorView!
    
    var alertController: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertController = UIAlertController(title:"Error", message: "Username or Password cannot be empty", preferredStyle: .alert)
        let button = UIAlertAction(title: "OK", style: .default, handler: { (action) in
        })
        alertController.addAction(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        if((usernameTextField.text!.isEmpty) || (passwordTextField.text!.isEmpty)){
            print("Empty!")
            present(alertController, animated: true, completion: {
            })
        }
        else{
            activityIndi.startAnimating()
            PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!) { (user, error) in
                if(user != nil){
                    self.activityIndi.stopAnimating()
                    self.performSegue(withIdentifier: "loginSuccess", sender: nil)
                }
                else{
                    self.alertController.message = "\(error!.localizedDescription)"
                    self.present(self.alertController, animated: true, completion: {
                        // After action
                        self.activityIndi.stopAnimating()
                    })
                }
            }
        }
    }
    
    @IBAction func signup(_ sender: Any) {
        if((usernameTextField.text!.isEmpty) || (passwordTextField.text!.isEmpty)){
            print("Empty!")
            present(alertController, animated: true, completion: {
            })
        }
        else{
            activityIndi.startAnimating()
            let newUser = PFUser()
            newUser.username = usernameTextField.text!
            newUser.password = passwordTextField.text!
            
            newUser.signUpInBackground { (success, error) in
                if(success){
                    self.activityIndi.stopAnimating()
                    self.performSegue(withIdentifier: "loginSuccess", sender: nil)
                }
                else{
                    print(error?.localizedDescription ?? "Error")
                    self.alertController.message = "\(error!.localizedDescription)"
                    self.present(self.alertController, animated: true, completion: {
                        self.activityIndi.stopAnimating()
                    })
                }
            }
        }
    }
}

