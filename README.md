IOS Quotes App
===============
   
### Implemented ###

3 View controllers

	1. EnterQuoteViewController - allows user to enter quote, this will be persisted in NSUserDefaults
	2. PickImageController (currently called ViewController) - allows user to pick an image from the Photo Library, saves a copy of selected image into user disk
	3. ProcessorViewController - Gets the quote and Image and displays it
	
### Pending items ###
	1. Layer quote on image - complete but needs cleanup
	2. Refactoring/renaming (app and controller)
	3. Better persistent store v/s NSUserDefaults like Core Data or Parse (if needed)
	4. Run on iPhone (works on Simulator only)
	5. Upload a good .gitingore for ios