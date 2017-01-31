//
//  ViewController.swift
//  BB app
//
//
//

import UIKit
import Firebase
import FirebaseDatabase
var ref : FIRDatabaseReference! = nil
class ViewController: UIViewController {
    var ref : FIRDatabaseReference! = nil
    
    
    var question_array=["82X7"," Q2 what is 93X46?","Q3 what is 74X23?","Q4 What is 64X31?","Q5 What is 72X59"]
    var answer_array=[574,4278,1656,1984,4248]
    var number_array=[32,83,56,34,6]
    var timerN = Timer ()
    var i = 0
    var m = 0
    var t = 0
    var n = 0
    var j = 0
    var timerCount = 0
    var timer = Timer()
    var user = ""
    var mathQ = 0
    var riskQ = 0

    //@IBOutlet var validanswerlabel: UILabel!
   
    @IBOutlet weak var optionBbutton: UIButton!
    @IBOutlet weak var optionAButton: UIButton!
    @IBOutlet weak var hcRightLable: UILabel!
    @IBOutlet weak var hcLeftLabel: UILabel!
    @IBOutlet weak var circleLabel: UILabel!
    @IBOutlet weak var halfCircleImg: UIImageView!
    @IBOutlet weak var circleImg: UIImageView!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var riskQuesLabel: UILabel!
    @IBOutlet weak var mathQuesLabel: UILabel!
    @IBOutlet var question: UILabel!
    @IBOutlet weak var riskQuesText: UITextField!
    @IBOutlet weak var mathQuesText: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet var answer: UITextField!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var submitAnswerButton: UIButton!
    @IBOutlet var submitNumber: UIButton!
    @IBOutlet weak var startTestButton: UIButton!
    
    @IBAction func StartTest(_ sender: Any) {
       
        if (mathQuesText.text != "" && riskQuesText.text != "" && userNameText.text != "" )
        {
        timerLabel.isHidden = true
        self.view.endEditing(true)
        user = userNameText.text!
        mathQ = Int(mathQuesText.text!)!
        riskQ = Int(riskQuesText.text!)!
        riskQuesText.isHidden = true
        mathQuesText.isHidden = true
        riskQuesLabel.isHidden = true
        mathQuesLabel.isHidden = true
        userNameText.isHidden = true
        userNameLabel.isHidden = true
        startTestButton.isHidden = true
        //timerLabel.text = String(t)
        
        createTimer()
        }
        else
        {
            self.aletControl()
            //validanswerlabel.text = "Please enter valid answer"
        }

        
    }
    @IBOutlet var numberText: UITextField!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var finishButton: UIButton!
    
    @IBAction func finishButton(_ sender: AnyObject) {
        exit(0)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
         ref = FIRDatabase.database().reference()
        timerLabel.isHidden = true
        question.isHidden = true
        finishButton.isHidden = true
        question.isHidden = true
        self.submitAnswerButton.isHidden = true
        self.answer.isHidden = true
        self.numberText.isHidden = true
        self.submitNumber.isHidden = true
        numberLabel.isHidden = true
        numberLabel.isHidden = true
        optionBbutton.isHidden = true
        optionAButton.isHidden = true
        hcRightLable.isHidden = true
        hcLeftLabel.isHidden = true
        circleLabel.isHidden = true
        halfCircleImg.isHidden = true
        circleImg.isHidden = true
     

        // Do any additional setup after loading the view, typically from a nib.
    }
    
 
    func questionTime()
    {
        t = 30
        timerLabel.isHidden = false
        self.question.isHidden = false
        self.submitAnswerButton.isHidden = false
        self.answer.isHidden = false
        numberLabel.isHidden = true
        question.text=question_array[i]
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.time), userInfo: nil, repeats: true)
        
    }
    func time()
    {
        
        t -= 1
        timerLabel.text = String(t)
        if t<=0
        {
            if (timer.isValid)
            {
                timer.invalidate()
            }
            timerLabel.isHidden = true
                self.view.endEditing(true)
            let quno: String = question_array[i]
            let answerEnt: Int = Int(answer.text!)!
            let answerAct: Int = answer_array[i]
            let userReference = ref.child(user).child("que").child(quno)
            let values = ["entered Answer": answerEnt, "ActualAnswer":answerAct]
            userReference.updateChildValues(values)
                if Int(answer.text!) == answer_array[i]
                {
                    // self.ref.child("users").child(quno).setValue(["entered Answer": answerEnt, "ActualAnswer":answerAct])
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
                questionTime()
                
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
        if(n<mathQ)
        {
            
        if  ksh ==  number_array[n]
        {
            let quno: String = String(n)
            let answerEnt: Int = ksh
            let answerAct: Int = number_array [n]
            let userReference = ref.child(user).child("mem").child(quno)
            let values = ["entered Answer": answerEnt, "ActualAnswer":answerAct]
            userReference.updateChildValues(values)
            j = j+1
            n = n+1
            numberText.text = ""
            createTimer()

        }
        else
        {
            let quno: String = String(n)
            let answerEnt: Int = ksh
            let answerAct: Int = number_array [n]
            let userReference = ref.child(user).child("mem").child(quno)
            let values = ["entered Answer": answerEnt, "ActualAnswer":answerAct]
            userReference.updateChildValues(values)
             n = n+1
            numberText.text = ""
            createTimer()
        }                                                                                                                                                                                                                                
        }
        else if (n==mathQ)
        
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
            riskQuestions()
        }
        }
       
            else
            {
                self.aletControl()
                //validanswerlabel.text = "Please enter valid answer"
            }
        
    }
    func riskQuestions()
    {
    }
    
    @IBAction func optionBselect(_ sender: Any) {
    }
    
    @IBAction func optionAselect(_ sender: Any) {
    }
}

