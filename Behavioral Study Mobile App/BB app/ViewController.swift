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
    
    var payamt = 0
    var question_first = 0
    var question_second = 0
    var ans = 0
    var number = 0
    var memlim = 0
    var question_selector = 0
    var riskCircle = 0
    var riskHCLeft = 0
    var riskHCRight = 0
    var timerN = Timer ()
    var i = 0
    var m = 0
    var t = 0
    var n = 0
    var j = 0
    var k = 0
    var timerCount = 0
    var timer = Timer()
    var user = ""
    var mathQ = 0
    var riskQ = 0
    var Qs = 0;
    var a = 0
    var b = 0
    var c = 0
    var s = 0
    var finalPayment = 0
    var quecount = 0
    //@IBOutlet var validanswerlabel: UILabel!
   
    @IBOutlet weak var instructText: UITextView!
    @IBOutlet weak var paymentLable: UILabel!
    @IBOutlet weak var optionBbutton: UIButton!
    @IBOutlet weak var optionAButton: UIButton!
    @IBOutlet weak var hcRightLable: UILabel!
    @IBOutlet weak var hcLeftLabel: UILabel!
    @IBOutlet weak var circleLabel: UILabel!
    @IBOutlet weak var halfCircleImg: UIImageView!
    @IBOutlet weak var circleImg: UIImageView!
    @IBOutlet var question: UILabel!
    @IBOutlet var answer: UITextField!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var submitNumber: UIButton!
    @IBOutlet weak var startTestButton: UIButton!
    
    @IBAction func StartTest(_ sender: Any) {
        s = mathQ + riskQ
        question_selector = Int(arc4random_uniform(UInt32(s)))
        instructText.isHidden = true
        timerLabel.isHidden = true
        paymentLable.isHidden = true
        self.view.endEditing(true)
        let userReferenceP = ref.child(user).child("Deatails")
        let values = ["Math Questions": mathQ, "Risk Questions":riskQ ," Number Memorization task":s]
        userReferenceP.updateChildValues(values)
        memlim = (mathQ+riskQ)/2
        
        startTestButton.isHidden = true
        
            
        createTimer()
     
        
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
       
        instructText.isHidden = false
        timerLabel.isHidden = true
        question.isHidden = true
        finishButton.isHidden = true
        question.isHidden = true
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
        quecount = quecount + 1
        question_first = Int(arc4random_uniform(7)) + 3
        question_second = Int(arc4random_uniform(7))+16
        t = 30
        timerLabel.isHidden = false
        self.question.isHidden = false
        self.answer.isHidden = false
        numberLabel.isHidden = true
        question.text = String(question_first) + " X " + String(question_second) + "?"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.time), userInfo: nil, repeats: true)
        
    }
    func time()
    {
        ans = question_first * question_second
        
        t -= 1
        timerLabel.text = String(t)
        if t<=0
        {
            if (timer.isValid)
            {
                timer.invalidate()
            }
            if (n == question_selector)
            {
                if Int(answer.text!) == ans
                {
                    finalPayment = payamt
                }
                else
                {
                    finalPayment = 0
                }
                
                let qunoP: String = String(question_first) + " X " + String(question_second) + "?"
                let answerEntP: Int = Int(answer.text!)!
                let answerActP: Int = ans
                let userReferenceP = ref.child(user).child("Deatails").child("Payment task").child("Math Question").child(qunoP)
                let values = ["entered Answer": answerEntP, "ActualAnswer":answerActP]
                userReferenceP.updateChildValues(values)
                if Int(answer.text!) == ans
                {
                finalPayment = payamt
                }
                else
                {
                finalPayment = 0
                }
                 let userReferencePA = ref.child(user).child("Deatails").child("Payment task").child("Final Payment")
                let valuesp = ["Payement" : finalPayment]
                userReferencePA.updateChildValues(valuesp)
             
            }
           
            timerLabel.isHidden = true
                self.view.endEditing(true)
            let quno: String = String(question_first) + " X " + String(question_second) + "?"
            let answerEnt: Int = Int(answer.text!)!
            let answerAct: Int = ans
            let userReference = ref.child(user).child("Math Questions").child(quno)
            let values = ["entered Answer": answerEnt, "ActualAnswer":answerAct]
            userReference.updateChildValues(values)
                if Int(answer.text!) == ans
                {
                    // self.ref.child("users").child(quno).setValue(["entered Answer": answerEnt, "ActualAnswer":answerAct])
                    m = m+1
                }
            
                self.question.text = " Enter the Memorized Number"
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
        self.answer.isHidden = true
        self.numberText.isHidden = true
        self.submitNumber.isHidden = true
        numberLabel.isHidden = false
        if (n <= memlim)
        {
            number = Int(arc4random_uniform(90)) + 10
        }
        else
        {
            number = Int(arc4random_uniform(900000000)) + 10000000
        }
        numberLabel.text = String (number)
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
        let lim = mathQ + riskQ
         var ksh=0
        let mem = numberText.text
        if (n < mathQ+riskQ)
            {
               
              if (numberText.text != "")
              {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
           
            if let number = formatter.number(from: mem!) {
                // number is an instance of NSNumber
                ksh = number.intValue
            }
            self.view.endEditing(true)
            let quno: String = String(n+1)
            let answerEnt: Int = ksh
            let answerAct: Int = number
            let userReference = ref.child(user).child("Number Memorization").child(quno)
            let values = ["entered Answer": answerEnt, "ActualAnswer":answerAct]
            userReference.updateChildValues(values)
             n = n+1
            numberText.text = ""
                if ksh == number
                {
                    j=j+1;
                }
                question_selector = Int(arc4random_uniform(UInt32(lim)))
                if (question_selector < mathQ && quecount <= mathQ)
                {
                    createTimer()
                }
                else if (k<riskQ)
                {
                    createTimerRisk()
                    
                }
      
              }
       
            else
            {
                self.aletControl()
                //validanswerlabel.text = "Please enter valid answer"
            }
    }
        else
        {
            let quno: String = String(n+1)
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal

            if let number = formatter.number(from: mem!) {
                // number is an instance of NSNumber
                ksh = number.intValue
            }
            self.view.endEditing(true)
            let answerEnt: Int = ksh
            let answerAct: Int = number
            let userReference = ref.child(user).child("Number Memorization").child(quno)
            let values = ["entered Answer": answerEnt, "ActualAnswer":answerAct]
            userReference.updateChildValues(values)
            if ksh == number
            {
                j=j+1;
            }
            n = n+1
            question.isHidden = false
            submitNumber.isHidden = true
            numberText.isHidden = true
            numberLabel.isHidden = false
            optionBbutton.isHidden = true
            optionAButton.isHidden = true
            hcRightLable.isHidden = true
            hcLeftLabel.isHidden = true
            circleLabel.isHidden = true
            halfCircleImg.isHidden = true
            circleImg.isHidden = true
            paymentLable.isHidden = false
            paymentLable.text = "Final Payment : " + String(finalPayment)
            question.text = "correct answer : " + String(m)
            numberLabel.text = "Number Memorized correctly: " + String(j)
            finishButton.isHidden = false
        }
        
    }
  /*  func riskQuestions()
    {
        
        
        optionBbutton.isHidden = false
        optionAButton.isHidden = false
        hcRightLable.isHidden = false
        hcLeftLabel.isHidden = false
        circleLabel.isHidden = false
        halfCircleImg.isHidden = false
        circleImg.isHidden = false
    }*/
    
    @IBAction func optionBselect(_ sender: Any) {
        let RiskQuesNo : String = String (k+1)
        let Option_A: Int = riskCircle
        let Option_B: String = String (riskHCLeft) + "|" + String(riskHCRight)
        let userReference = ref.child(user).child("RiskQuestion").child(RiskQuesNo)
        let values = ["Selected Anser": Option_B, "Option A":Option_A, "Option B" : Option_B] as [String : Any]
        userReference.updateChildValues(values)
        if (n == question_selector)
        {
        
            let RiskQuesNoP : String = String (k+1)
            let Option_AP: Int = riskCircle
            let Option_BP: String = String (riskHCLeft) + "|" + String(riskHCRight)
            let userReferenceP = ref.child(user).child("Deatails").child("Payment task").child("Risk Question").child(RiskQuesNoP)
            let values = ["Selected Anser": Option_BP, "Option A":Option_AP, "Option B" : Option_BP] as [String : Any]
            userReferenceP.updateChildValues(values)
            if (n % 2 == 0)
            {
                finalPayment = riskHCRight
            }
            else
            {
                finalPayment = riskHCLeft
            }
            let userReferencePA = ref.child(user).child("Deatails").child("Payment task").child("Final Payment")
            let valuesp = ["Payement" : finalPayment]
            userReferencePA.updateChildValues(valuesp)
            
        }
    }
    
    @IBAction func optionAselect(_ sender: Any) {
       // self.view.endEditing(true)
        let RiskQuesNo : String = String (k+1)
        let Option_A: Int = riskCircle
        let Option_B: String = String (riskHCLeft) + "|" + String(riskHCRight)
        let userReference = ref.child(user).child("RiskQuestion").child(RiskQuesNo)
        let values = ["Selected Anser": Option_A, "Option A":Option_A, "Option B" : Option_B] as [String : Any]
        userReference.updateChildValues(values)
        if (n == question_selector)
        {
            let RiskQuesNoP : String = String (k+1)
            let Option_AP: Int = riskCircle
            let Option_BP: String = String (riskHCLeft) + "|" + String(riskHCRight)
            let userReferenceP = ref.child(user).child("Deatails").child("Payment task").child("Risk Question").child(RiskQuesNoP)
            let values = ["Selected Anser": Option_AP, "Option A":Option_AP, "Option B" : Option_BP] as [String : Any]
            userReferenceP.updateChildValues(values)
            
                finalPayment = riskCircle
            
            let userReferencePA = ref.child(user).child("Deatails").child("Payment task").child("Final Payment")
            let valuesp = ["Payement" : finalPayment]
            userReferencePA.updateChildValues(valuesp)
            
        }
    }
    func RiskquestionTime()
    {
        optionBbutton.isHidden = false
        optionAButton.isHidden = false
        hcRightLable.isHidden = false
        hcLeftLabel.isHidden = false
        circleLabel.isHidden = false
        halfCircleImg.isHidden = false
        circleImg.isHidden = false
        question.text = "Choose from following options";
        t = 30
        timerLabel.isHidden = false
        numberLabel.isHidden = true
      //  question.text=question_array[i]
        
        a = Int(arc4random_uniform(10)) - 5
        b = Int(arc4random_uniform(11))
        c = Int(arc4random_uniform(4)) + 1
        riskCircle = payamt + a
        riskHCLeft = riskCircle - b
        riskHCRight = riskCircle + b + c
        circleLabel.text = String (riskCircle)
        hcLeftLabel.text = String (riskHCLeft)
        hcRightLable.text = String (riskHCRight)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timeRisk), userInfo: nil, repeats: true)
        
    }
    func timeRisk()
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
           
            k += 1
            optionBbutton.isHidden = true
            optionAButton.isHidden = true
            hcRightLable.isHidden = true
            hcLeftLabel.isHidden = true
            circleLabel.isHidden = true
            halfCircleImg.isHidden = true
            circleImg.isHidden = true
            self.question.text = " Enter the Memorized Number"
            self.answer.isHidden = true
            self.numberText.isHidden = false
            self.submitNumber.isHidden = false
           // answer.text = ""
            
        }
        
        
    }
    func createTimerRisk ()
    {
        optionBbutton.isHidden = true
        optionAButton.isHidden = true
        hcRightLable.isHidden = true
        hcLeftLabel.isHidden = true
        circleLabel.isHidden = true
        halfCircleImg.isHidden = true
        circleImg.isHidden = true
        question.isHidden = true
        submitNumber.isHidden = true
        question.isHidden = true
        finishButton.isHidden = true
        timerCount = 4
        
        if (timerN.isValid)
        {
            timerN.invalidate ()
        }
        if (n <= memlim)
        {
            number = Int(arc4random_uniform(90)) + 10
        }
        else
        {
            number = Int(arc4random_uniform(900000000)) + 10000000
        }
        question.isHidden = false
        finishButton.isHidden = true
        question.text = "Memorize the Number"
        self.answer.isHidden = true
        self.numberText.isHidden = true
        self.submitNumber.isHidden = true
        numberLabel.isHidden = false
        numberLabel.text = String (number)
        
        timerN = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimerRisk), userInfo: nil, repeats: true)
    }
    
    func updateTimerRisk ()
    {
        timerCount -= 1
        if timerCount <= 0
        {
            RiskquestionTime()
            
            if (timerN.isValid)
            {
                timerN.invalidate()
            }
            
        }
    }
}

