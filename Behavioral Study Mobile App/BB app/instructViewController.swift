//
//  instructViewController.swift
//  BB app
//
//  Created by checkout on 3/31/17.
//  Copyright © 2017 Akhil. All rights reserved.
//

import UIKit


class instructViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startTestBut(_ sender: Any) {
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destviewcontrol : ViewController = segue.destination as! ViewController
        
        destviewcontrol.sttest()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
