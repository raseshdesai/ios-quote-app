//
//  ViewController.swift
//  GetImageFromPhotoLibrary
//
//  Created by Rasesh Desai on 3/21/15.
//  Copyright (c) 2015 Rasesh Desai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var pickedImage: UIImageView!
    
    var passedPathToUserSelectedSavedImage: String = "path-not-passed-by-enter-quote-controller"
    
    @IBAction func pickImage(sender: AnyObject) {
        
        var imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imageController.allowsEditing = false
        
        self.presentViewController(imageController, animated: true) {
            () -> Void in
                println("Image presented to the User to pick from his/her photo library..!")
            }
    }

    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("User picked an image photo library..!")
        self.dismissViewControllerAnimated(true, completion: nil)
        pickedImage.image = image
        
        //Save this image to user directory
        var data: NSData = UIImageJPEGRepresentation(image, 1)
        println("Adding: \(passedPathToUserSelectedSavedImage): ")
        NSFileManager.defaultManager().createFileAtPath(passedPathToUserSelectedSavedImage, contents: data, attributes: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Verify if the
        var userEnteredQuote: String? = NSUserDefaults.standardUserDefaults().objectForKey("userEnteredQuote") as? String
        println(userEnteredQuote)
        
        //Not needed anymore, processor will remember the app user selected at any point during the session
//        removeUserSelectedFile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueToProcessorViewController") {
            var processorViewController = segue.destinationViewController as ProcessorViewController
            processorViewController.passedPathToUserSelectedSavedImage = passedPathToUserSelectedSavedImage
        }
    }
    
    func removeUserSelectedFile(){
        println("Removing: \(passedPathToUserSelectedSavedImage): ")
        NSFileManager.defaultManager().removeItemAtPath(passedPathToUserSelectedSavedImage, error: nil)
    }
}

