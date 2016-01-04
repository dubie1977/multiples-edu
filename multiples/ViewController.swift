//
//  ViewController.swift
//  multiples
//
//  Created by Joseph DuBay on 1/3/16.
//  Copyright © 2016 DuBay Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Start screen outlets
    @IBOutlet weak var multiplesImg: UIImageView!
    @IBOutlet weak var userNumberTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    //Running screen outlets
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var userMsgLbl: UILabel!
    
    //Global Vars
    var userEnteredNumber = 0
    var currentValue = 0
    var numberOfTimesAdded = 0
    var nextValue = 0
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
//        //NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
//    }
//    
//    func keyboardWillShow(sender: NSNotification) {
//        self.view.frame.origin.y -= 150
//    }
//    func keyboardWillHide(sender: NSNotification) {
//        self.view.frame.origin.y += 150
//    }
    
    
    
//actions
    @IBAction func playClicked(sender: UIButton) {
        
        if(userNumberTxt.text != nil && userNumberTxt.text! != "" && userNumberTxt.text != "What mutiple to add by?"){
            userEnteredNumber = Int(userNumberTxt.text!)!
            currentValue = 0
            numberOfTimesAdded = 0
            nextValue = 0
            userMsgLbl.text = "Press ADD to add"
            isGameRestarting(false)
            self.view.endEditing(true)
        }
    }
    
    @IBAction func addClicked(sender: UIButton) {
        nextValue = currentValue + userEnteredNumber
        userMsgLbl.text = "\(currentValue) + \(userEnteredNumber) = \(nextValue)"
        currentValue = nextValue
        if isAddingDone(){
            isGameRestarting(true)
        }
        numberOfTimesAdded++
    }
    
    
    
    
//internal functions
    func isGameRestarting (starting: Bool){
        multiplesImg.hidden = !starting
        userNumberTxt.hidden = !starting
        playBtn.hidden = !starting
        
        addBtn.hidden = starting
        userMsgLbl.hidden = starting
    }
    
    func isAddingDone() -> Bool{
        return numberOfTimesAdded >= userEnteredNumber
    }

}

