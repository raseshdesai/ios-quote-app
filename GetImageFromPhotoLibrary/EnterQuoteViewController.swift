//
//  EnterQuoteViewController.swift
//  GetImageFromPhotoLibrary
//
//  Created by Rasesh Desai on 3/21/15.
//  Copyright (c) 2015 Rasesh Desai. All rights reserved.
//

import UIKit

class EnterQuoteViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var userEnteredQuote: UITextView!
    
    var pathToUserSelectedSavedImage: String = "path-to-user-selectec-image-not-initailzed"
    
    @IBAction func addQuote(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject(userEnteredQuote.text, forKey: "userEnteredQuote")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.userEnteredQuote.delegate = self
        
        //Set a new user path as global var
        var documentDirectory: String?
        var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        if paths.count > 0 {
            documentDirectory = paths[0] as? String
            pathToUserSelectedSavedImage = documentDirectory! + "/userSelectedImage.jpg"
            println("Setting: \(pathToUserSelectedSavedImage)")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueToPickImageController") {
            var pickImageController = segue.destinationViewController as ViewController
            pickImageController.passedPathToUserSelectedSavedImage = pathToUserSelectedSavedImage
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
