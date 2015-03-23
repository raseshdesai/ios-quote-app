//
//  ProcessorViewController.swift
//  GetImageFromPhotoLibrary
//
//  Created by Rasesh Desai on 3/21/15.
//  Copyright (c) 2015 Rasesh Desai. All rights reserved.
//

import UIKit
import AssetsLibrary

class ProcessorViewController: UIViewController {

    @IBOutlet weak var userEnteredQuoteLabel: UILabel!
    
    @IBOutlet weak var userSelectedImageToDisplay: UIImageView!
    
    @IBOutlet weak var processedImage: UIImageView!
    
    
    @IBOutlet weak var testImage: UIImageView!
    
    var l: CALayer {
        return testImage.layer
    }
    
    var passedPathToUserSelectedSavedImage: String = "path-not-passed-by-pick-image-controller"
    
    var context: CIContext!
    var filter: CIFilter!
    var beginImage: CIImage!
    
    @IBAction func savePhoto(sender: AnyObject) {
        //TODO: This code does not work on Simulator, and also not sure about default image name and property to update it, could ask for user input
//        let imageToSave = filter.outputImage
//        let softwareContext = CIContext(options:[kCIContextUseSoftwareRenderer: true])
//        let cgimg = softwareContext.createCGImage(imageToSave, fromRect:imageToSave.extent())
//        let library = ALAssetsLibrary()
//        library.writeImageToSavedPhotosAlbum(cgimg, metadata:imageToSave.properties(), completionBlock:nil)
    }
    
    @IBAction func updateIntensity(sender: UISlider!) {
        let sliderValue = sender.value
        performImageProcessing(sliderValue)
    }
    
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
            performImageProcessing(0.5)
        }
    }
    
    func performImageProcessing(intensityValue: Float){
        
        // 1
        beginImage = CIImage(image: userSelectedImageToDisplay.image)
        
        // 2 (build a filter that'll be applied on your image)
        filter = CIFilter(name: "CISepiaTone")
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        filter.setValue(intensityValue, forKey: kCIInputIntensityKey)
        
        // 3 (reusing existing context for better performance)
        context = CIContext(options:nil)
        
        //4 (create CGImage from filter's output image)
        let cgimg = context.createCGImage(filter.outputImage, fromRect: filter.outputImage.extent())
        
        //4 (build new image and show)
        let newImage = UIImage(CGImage: cgimg)
        self.processedImage.image = newImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func draw(sender: AnyObject) {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 288, height: 261), false, 0)
        let testContext = UIGraphicsGetCurrentContext()
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Left
        
        let attrs = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 16)!, NSParagraphStyleAttributeName: paragraphStyle]
        
        let quote: NSString = userEnteredQuoteLabel.text!
//        quote.drawWithRect(CGRect(x: 10, y: 10, width: 288, height: 50), options: .UsesLineFragmentOrigin, attributes: attrs, context: nil)
        
        let backgroungImage = processedImage.image
//        backgroungImage?.drawAtPoint(CGPoint(x: 0, y: 60))
        backgroungImage?.drawInRect(CGRect(x: 0, y: 0, width: 288, height: 261))
        
        CGContextSetBlendMode(testContext, kCGBlendModeMultiply)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        self.testImage.image = img
        
        
        //Play with layers for testImage
//        l.backgroundColor = UIColor.whiteColor().CGColor
        l.borderWidth = 2.0
        l.borderColor = UIColor.blackColor().CGColor
        l.shadowOpacity = 0.7
        l.shadowRadius = 10.0
        l.opacity = 0.7
        
//        l.contents = processedImage.image?.CGImage
//        l.contents = img
//        l.contentsGravity = kCAGravityCenter
        
        //Text Layer - test code
        // 1
        let textLayer = CATextLayer()
        textLayer.frame = testImage.bounds
        
        // 2
        textLayer.string = quote
        
        // 3
        let fontName: CFStringRef = "Noteworthy-Light"
        let fontSize: CGFloat = 12.0
        textLayer.font = CTFontCreateWithName(fontName, fontSize, nil)
        
        // 4
        textLayer.foregroundColor = UIColor.darkGrayColor().CGColor
        textLayer.wrapped = true
        textLayer.alignmentMode = kCAAlignmentLeft
        textLayer.contentsScale = UIScreen.mainScreen().scale
        l.addSublayer(textLayer)
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
