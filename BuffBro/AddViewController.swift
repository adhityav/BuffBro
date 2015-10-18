//
//  AddViewController.swift
//  BuffBro
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 Adhitya Vadivel. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    
    var newItem: ExerciseItem?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var setsTextField: UITextField!
    @IBOutlet weak var repsTextField: UITextField!
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if let name = nameTextField.text, setsString = setsTextField.text, repsString = repsTextField.text {
            if !name.isEmpty && Int(setsString) != nil && Int(repsString) != nil {
                return true
            } else {
                let alertController = UIAlertController(title: "Error", message:
                    "Please enter a valid number.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                return false
            }
        } else {
            let alertController = UIAlertController(title: "Error", message:
                "Please enter a valid number.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            if let name = nameTextField.text, setsString = setsTextField.text, repsString = repsTextField.text {
                
                if !name.isEmpty && Int(setsString) != nil && Int(repsString) != nil {
                    newItem = ExerciseItem(name: name, sets: Int(setsString)!, reps: Int(repsString)!)
                }
            }
        }
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

