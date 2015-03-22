//
//  ProcessorViewController.swift
//  GetImageFromPhotoLibrary
//
//  Created by Rasesh Desai on 3/21/15.
//  Copyright (c) 2015 Rasesh Desai. All rights reserved.
//

import UIKit

class ProcessorViewController: UIViewController {

    @IBOutlet weak var userEnteredQuoteLabel: UILabel!
    
    @IBOutlet weak var userSelectedImageToDisplay: UIImageView!
    
    var passedPathToUserSelectedSavedImage: String = "path-not-passed-by-pick-image-controller"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        println("At the processor view controller")
        
        var userEnteredQuote: String? = NSUserDefaults.standardUserDefaults().objectForKey("userEnteredQuote") as? String
        userEnteredQuoteLabel.text = userEnteredQuote
        
        //get and display user selected and saved image from user directory
        println("Showing: \(passedPathToUserSelectedSavedImage): ")
        
        if NSFileManager.defaultManager().fileExistsAtPath(passedPathToUserSelectedSavedImage, isDirectory: nil) {
            userSelectedImageToDisplay.image = UIImage(contentsOfFile: passedPathToUserSelectedSavedImage)!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
