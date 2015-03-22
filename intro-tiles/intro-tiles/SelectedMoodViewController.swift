
//  SelectedMoodViewController.swift
//  intro-tiles
//
//  Created by Scott Tong on 3/17/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class SelectedMoodViewController: UIViewController, UIGestureRecognizerDelegate  {
    
	@IBOutlet weak var moodBackgroundColor: UIView!
    @IBOutlet weak var cardScrollView: UIScrollView!
    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card3: UIImageView!
	@IBOutlet weak var containerView: UIView!
    @IBOutlet weak var helpText: UILabel!
    @IBOutlet weak var contactsView: UIView!
    
    var fadeTransition: FadeTransition!
    
	var tilesViewController: TilesViewController!
	var bgcolor: UIColor!
    
    var contactsViewController: ContactsViewController!
    
    var selectedCardImageView: UIImageView!
    var backgroundCardImageView: UIImageView!
    
    //Card globals
    var cardPanBegan : CGFloat!
    var finalCardPosition: CGFloat!
    var originalCardPos: CGFloat!
    var cardScrollFrame: CGFloat!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		moodBackgroundColor.backgroundColor = bgcolor
        
        // Get the contacts view controller from the storyboard
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        contactsViewController = storyboard.instantiateViewControllerWithIdentifier("contactsStoryView") as ContactsViewController
        contactsView.addSubview(contactsViewController.view)
        
        
        // Set the scroll view to the amount of cards + gutter
        cardScrollView.contentSize = CGSize(width: card1.frame.width * 4 + 50, height: card1.frame.height)
        
        // Set up the animation
        helpText.alpha = 0
        helpText.frame.origin.x = helpText.frame.origin.x + 50
        cardScrollView.frame.origin.x = cardScrollView.frame.origin.x + 150
        
        // Animate the cards and text in
        UIView.animateWithDuration(1.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 17, options: nil, animations: { () -> Void in
            self.cardScrollView.frame.origin.x = self.cardScrollView.frame.origin.x - 150
        }, completion: nil)
        UIView.animateWithDuration(1.3, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 15, options: nil, animations: { () -> Void in
            self.helpText.alpha = 1
            self.helpText.frame.origin.x = self.helpText.frame.origin.x - 50
        }, completion: nil)
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
		
		var storyboard = UIStoryboard(name: "Main", bundle: nil)
		tilesViewController = storyboard.instantiateViewControllerWithIdentifier("tilesStory") as TilesViewController
    }
	
	override func viewDidAppear(animated: Bool) {
        originalCardPos = card1.center.y
	}
    
	@IBAction func didPressDismissButton(sender: AnyObject) {

		// for push transition
		navigationController!.popViewControllerAnimated(true)
	}
    
    @IBAction func tapCard(sender: UITapGestureRecognizer) {

        selectedCardImageView = sender.view as UIImageView!
        backgroundCardImageView = UIImageView(image: selectedCardImageView.image)
        backgroundCardImageView.contentMode = selectedCardImageView.contentMode
        backgroundCardImageView.clipsToBounds = selectedCardImageView.clipsToBounds
        
//        var window = UIApplication.sharedApplication().keyWindow!
        moodBackgroundColor.addSubview(backgroundCardImageView)
//        view.bringSubviewToFront(contactsView)
        
        //blur image view
        var lightBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var blurView = UIVisualEffectView(effect: lightBlur)
        blurView.frame = moodBackgroundColor.bounds
        moodBackgroundColor.addSubview(blurView)
        
        UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 5, options: nil, animations: { () -> Void in
            self.backgroundCardImageView.center = CGPointMake(187.5, 100)
            self.contactsView.frame.origin.y = 0
        }) { (Bool) -> Void in
            //
        }
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
