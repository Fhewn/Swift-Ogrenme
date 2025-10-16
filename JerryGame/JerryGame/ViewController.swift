//
//  ViewController.swift
//  JerryGame
//
//  Created by Fhewn on 15.10.2025.
//

import UIKit

class ViewController: UIViewController {
    //Variables
    
    var timer = Timer()
    var counter = 0
    var score = 0
    var jerryArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    
    //Views
    
    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var lblscore: UILabel!
    @IBOutlet weak var lblhigthscore: UILabel!
    @IBOutlet weak var imgjerry1: UIImageView!
    @IBOutlet weak var imgjerry2: UIImageView!
    @IBOutlet weak var imgjerry3: UIImageView!
    @IBOutlet weak var imgjerry4: UIImageView!
    @IBOutlet weak var imgjerry5: UIImageView!
    @IBOutlet weak var imgjerry6: UIImageView!
    @IBOutlet weak var imgjerry7: UIImageView!
    @IBOutlet weak var imgjerry8: UIImageView!
    @IBOutlet weak var imgjerry9: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblscore.text = "Score: \(score)"
        
        //High Score Check
        
        let storeHighScore = UserDefaults.standard.object(forKey: "HighScore")
        if storeHighScore == nil {
            highScore = 0
            lblhigthscore.text = "HighScore: \(highScore)"
        }
        if let  newScore = storeHighScore as? Int {
             highScore = newScore
            lblhigthscore.text = "HighScore: \(highScore)"
        }
        
        
        //Images
        imgjerry1.isUserInteractionEnabled = true
        imgjerry2.isUserInteractionEnabled = true
        imgjerry3.isUserInteractionEnabled = true
        imgjerry4.isUserInteractionEnabled = true
        imgjerry5.isUserInteractionEnabled = true
        imgjerry6.isUserInteractionEnabled = true
        imgjerry7.isUserInteractionEnabled = true
        imgjerry8.isUserInteractionEnabled = true
        imgjerry9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        imgjerry1.addGestureRecognizer(recognizer1)
        imgjerry2.addGestureRecognizer(recognizer2)
        imgjerry3.addGestureRecognizer(recognizer3)
        imgjerry4.addGestureRecognizer(recognizer4)
        imgjerry5.addGestureRecognizer(recognizer5)
        imgjerry6.addGestureRecognizer(recognizer6)
        imgjerry7.addGestureRecognizer(recognizer7)
        imgjerry8.addGestureRecognizer(recognizer8)
        imgjerry9.addGestureRecognizer(recognizer9)
        
        jerryArray = [imgjerry1 , imgjerry2 , imgjerry3 , imgjerry4 , imgjerry5 ,imgjerry6 , imgjerry7 , imgjerry8 , imgjerry9]
        //jerryArray.append(imgjerry1)
        
        
        //Timers
        
        counter = 10
        lbltime.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown ), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(hideJerry), userInfo: nil, repeats: true)
        
        
        hideJerry()
        
    }
    
    @objc func hideJerry() {
        //imgjerry1.isHidden = true
        for jerry in jerryArray {
            jerry.isHidden = true
        }
       let random =  Int(arc4random_uniform(UInt32(jerryArray.count - 1)))
        jerryArray[random].isHidden = false
    }
    
    
@objc func increaseScore()
    {
        score += 1
        lblscore.text = "Score: \(score)"
        
    }
    @objc func countDown()
    {
     counter -= 1
    lbltime.text = "Time: \(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            for jerry in jerryArray {
                jerry.isHidden = true
            }
            
            //High Score
            if self.score > self.highScore {
                self.highScore = self.score
                lblhigthscore.text = "High Score: \(self.highScore)"
                UserDefaults.standard.set( self.highScore, forKey: "HighScore")
            }
            
            //Alert
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okeyButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.cancel, handler: nil)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                //replay  function
                self.score = 0
                self.lblscore.text = "Score: \(self.score)"
                self.counter = 10
                self.lbltime.text = "Time: \(self.counter)"
               
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown ), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(self.hideJerry), userInfo: nil, repeats: true)
        }
            alert.addAction(okeyButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil )
        
        }
    }
}

