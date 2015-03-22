//
//  FinalViewController.swift
//  GetImageFromPhotoLibrary
//
//  Created by Rasesh Desai on 3/21/15.
//  Copyright (c) 2015 Rasesh Desai. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {

//    @IBOutlet weak var userEnteredQuoteLabel: UILabel!
    
//    @IBOutlet weak var userSelectedImageForDisplay: UIImageView!
    
    
    @IBOutlet weak var userEnteredQuoteLabel: UILabel!
    
    
    @IBOutlet weak var userSelectedImageForDisplay: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Get the quote
//        var userEnteredQuote: String? = NSUserDefaults.standardUserDefaults().objectForKey("userEnteredQuote") as? String
//        userEnteredQuoteLabel.text = userEnteredQuote
        
        //Get the image
//        var documentDirectory: String?
//        var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
//        if paths.count > 0 {
//            documentDirectory = paths[0] as? String
//            var pathToUserSelectedSavedImage = documentDirectory! + "/userSelectedImage.jpg"
//            var userSelectedSavedImage = UIImage(named: pathToUserSelectedSavedImage)
//            userSelectedImageForDisplay.image = userSelectedSavedImage
//        }
        
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
