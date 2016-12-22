//
//  ViewController.swift
//  BB app
//
//
//

import UIKit

class ViewController: UIViewController {
    var question_array=["Q.1 What is 82X7?"," Q.2 what is 93X46?","Q.3 what is 74X23?","Q.4 What is 64X31?","Q.5 What is 72X59"]
    var answer_array=[574,4278,1656,1984,4248]
    var number_array=[32,83,56,34,6]
    var timerN = Timer ()
    var i = 0
    var m = 0
    var t = 60
    var n = 0
    var j = 0
    var timerCount = 0
    var timer = Timer()

    //@IBOutlet var validanswerlabel: UILabel!
    @IBOutlet var question: UILabel!
    @IBOutlet var answer: UITextField!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var submitAnswerButton: UIButton!
    @IBOutlet var submitNumber: UIButton!
    @IBOutlet var numberText: UITextField!
    @IBOutlet var numberLabel: UILabel!

    @IBAction func finishButton(_ sender: AnyObject) {
        exit(0)
    }
    @IBOutlet var finishButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = String(t)
       timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(ViewController.time), userInfo: nil, repeats: true)
        createTimer()

        // Do any additional setup after loading the view, typically from a nib.
    }
        func time()
    {

        t -= 1
        timerLabel.text = String(t)
        if t<=0
        {
            self.view.endEditing(true)
            question.isHidden = false
            answer.isHidden = true
            submitAnswerButton.isHidden = true
            submitNumber.isHidden = true
            numberText.isHidden = true
            finishButton.isHidden = false
            timerLabel.isHidden = true
            question.text = "correct answer is " + String(m) + "/n Numbers Memorized Correctly: " + String(j)
        }


    }
    @IBAction func submit(_ sender: AnyObject) {
        if (Int(answer.text!) != nil)
        {
           self.view.endEditing(true)

            if Int(answer.text!) == answer_array[i]
            {
                m = m+1
                i = i+1
            }
            else
            {
                i = i+1

            }
            self.question.text = " Enter the Memorized Number"
            self.submitAnswerButton.isHidden = true
            self.answer.isHidden = true
            self.numberText.isHidden = false
            self.submitNumber.isHidden = false

            answer.text = ""
        }
        else
        {
            self.aletControl()
           //validanswerlabel.text = "Please enter valid answer"
        }
     
    }
    func createTimer ()
    {
        timerCount = 4

        if (timerN.isValid)
        {
            timerN.invalidate ()
        }
        question.isHidden = false
        finishButton.isHidden = true
        question.text = "Memorize the Number"
        self.submitAnswerButton.isHidden = true
        self.answer.isHidden = true
        self.numberText.isHidden = true
        self.submitNumber.isHidden = true
        numberLabel.isHidden = false
        numberLabel.text = String (number_array [n])

        timerN = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }

    func updateTimer ()
    {
        timerCount -= 1
        if timerCount <= 0
            {
                self.question.isHidden = false
                self.submitAnswerButton.isHidden = false
                self.answer.isHidden = false
                numberLabel.isHidden = true
                question.text=question_array[i]
                if (timerN.isValid)
                {
                    timerN.invalidate()
                }
        }
    }
    func aletControl()
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

    @IBAction func submitNumber(_ sender: AnyObject) {
        
        if (numberText.text != "")
        {
            let mem = numberText.text
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            var ksh=0
            if let number = formatter.number(from: mem!) {
                // number is an instance of NSNumber
                ksh = number.intValue
            }
            self.view.endEditing(true)
        if(n<4)
        {
            
        if  ksh ==  number_array[n]
        {
            j = j+1
            n = n+1
            numberText.text = ""
            createTimer()

        }
        else
        {
             n = n+1
            numberText.text = ""
            createTimer()
        }
        }
        else if (n==4)
        
        {
            if  Int(numberText.text!) ==  number_array[n]
            {
                j = j+1
                n = n+1
            }
            else
            {
                n = n+1
                
            }
             question.isHidden = false
            submitNumber.isHidden = true
            numberText.isHidden = true
            numberLabel.isHidden = false
             question.text = "correct answer : " + String(m)
            numberLabel.text = "Number Memorized correctly: " + String(j)
            finishButton.isHidden = false
            
        }
        }
       
            else
            {
                self.aletControl()
                //validanswerlabel.text = "Please enter valid answer"
            }
        
    }
}

