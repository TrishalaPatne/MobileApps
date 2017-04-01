//
//  instructViewController.swift
//  BB app
//
//  Created by checkout on 3/31/17.
//  Copyright © 2017 Akhil. All rights reserved.
//

import UIKit


class instructViewController: UIViewController {

    @IBOutlet weak var paymentText: UITextField!
    @IBOutlet weak var riskQuesText: UITextField!
    @IBOutlet weak var mathQuesText: UITextField!
    @IBOutlet weak var userNameText: UITextField!
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) 
        {
            let destviewcontrol : ViewController = segue.destination as! ViewController
            if (mathQuesText.text != "" && riskQuesText.text != "" && userNameText.text != "" )
            {
                destviewcontrol.user = userNameText.text!
                destviewcontrol.riskQ = Int(riskQuesText.text!)!
                destviewcontrol.mathQ = Int(mathQuesText.text!)!
                destviewcontrol.payamt = Int(paymentText.text!)!
            }
            else
            {
                self.alertControl()
                //validanswerlabel.text = "Please enter valid answer"
            }    }
    
    func alertControl()
    {
        let alertController = UIAlertController(title: "Invalid Input", message: "Please input valid number!!", preferredStyle: .alert
        )
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
        
        // Add the actions
        alertController.addAction(okAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    

}
