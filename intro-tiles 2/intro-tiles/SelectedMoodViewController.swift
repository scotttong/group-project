
//  SelectedMoodViewController.swift
//  intro-tiles
//
//  Created by Scott Tong on 3/17/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class SelectedMoodViewController: UIViewController {
    
	@IBOutlet weak var moodBackgroundColor: UIView!
    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card3: UIImageView!
	@IBOutlet weak var containerView: UIView!
    @IBOutlet weak var helpText: UILabel!
    @IBOutlet weak var contactContainer: UIView!
    @IBOutlet weak var cardContainer: UIView!
    
    var fadeTransition: FadeTransition!
	var tilesViewController: TilesViewController!
	var bgcolor: UIColor!
    
    //Card globals
    var cardContainerPanBegan : CGFloat!
    var finalCardContainerPosition: CGFloat!
    var originalCardPos: CGFloat!
    var cardScrollFrame: CGFloat!
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)

        // Do any additional setup after loading the views.
		moodBackgroundColor.backgroundColor = bgcolor
        
        // Set up the animation
        helpText.alpha = 0
        helpText.frame.origin.x = helpText.frame.origin.x + 50
        cardContainer.frame.origin.x = cardContainer.frame.origin.x + 150
        
        // Animate the cards and text in
        UIView.animateWithDuration(1.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 17, options: .AllowUserInteraction, animations: { () -> Void in
            self.cardContainer.frame.origin.x = self.cardContainer.frame.origin.x - 150
        }, completion: nil)
        UIView.animateWithDuration(1.3, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 15, options: .AllowUserInteraction, animations: { () -> Void in
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
	}
    
	@IBAction func didPressDismissButton(sender: AnyObject) {
		// for modal transition
		//dismissViewControllerAnimated(true, completion: nil)

		// for push transition
		navigationController!.popViewControllerAnimated(true)
	}
    
    
    @IBAction func didTapCard(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("contactsSegue", sender: self)
    }
    
    
    @IBAction func cardContainerPan(sender: UIPanGestureRecognizer) {
        
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if (sender.state == UIGestureRecognizerState.Began) {
            cardContainerPanBegan = cardContainer.frame.origin.x
            
        } else if(sender.state == UIGestureRecognizerState.Changed) {
            println(cardContainer.frame.origin.x)
            
            finalCardContainerPosition = cardContainerPanBegan + translation.x
            cardContainer.frame.origin.x = finalCardContainerPosition
            
        } else if(sender.state == UIGestureRecognizerState.Ended) {
            
            // If user scrolls left
            if (cardContainer.frame.origin.x > 0) {
                println("state 1 hit")
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: nil, animations: { () -> Void in
                    self.cardContainer.frame.origin.x = 0
                }, completion: nil)
            
            // If user starts to scroll to the right
            } else if (cardContainer.frame.origin.x < 0 && cardContainer.frame.origin.x > -160) {
                println("state 2 hit")
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: nil, animations: { () -> Void in
                    self.cardContainer.frame.origin.x = 0
                    }, completion: nil)
            // If user scrolls past first card midpoint
            } else if (cardContainer.frame.origin.x < -160 && cardContainer.frame.origin.x > -485) {
                println("state 3 hit")
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: nil, animations: { () -> Void in
                    self.cardContainer.frame.origin.x = -320
                    }, completion: nil)
            // If user scrolls past second card midpoint
            } else if (cardContainer.frame.origin.x < -484) {
                println("state 3 hit")
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: nil, animations: { () -> Void in
                    self.cardContainer.frame.origin.x = -642
                    }, completion: nil)
            }
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
