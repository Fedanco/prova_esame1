//
//  ViewController.swift
//  prova_esame
//
//  Created by ifts26 on 21/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var email_textField: UITextField!
    @IBOutlet weak var password_textField: UITextField!
    @IBOutlet weak var button_login: UIButton!
    
    var email = ""
    var pass = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login_action(_ sender: Any) {
        if email_textField.text == email && password_textField.text == pass {
            performSegue(withIdentifier: "second", sender: nil)
        } else {
            errorAlert()
        }
    }
    
    func errorAlert() {
        let alert = UIAlertController(title: "Credenziali sbagliate", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Okay", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    

}

