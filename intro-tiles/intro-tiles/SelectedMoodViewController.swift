
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
    
    var fadeTransition: FadeTransition!
    
	var tilesViewController: TilesViewController!
	var bgcolor: UIColor!
    
    //Card globals
    var cardPanBegan : CGFloat!
    var finalCardPosition: CGFloat!
    var originalCardPos: CGFloat!
    var cardScrollFrame: CGFloat!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		moodBackgroundColor.backgroundColor = bgcolor
        
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
		// for modal transition
		//dismissViewControllerAnimated(true, completion: nil)

		// for push transition
		navigationController!.popViewControllerAnimated(true)
	}
    
    @IBAction func didPressCard(sender: AnyObject) {
        
//        view.bringSubviewToFront(self.card1)
//        
//        UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//            self.card1.transform = CGAffineTransformMakeScale(0.8, 0.8)
//            }) { (Bool) -> Void in
//                UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//                    self.card1.transform = CGAffineTransformMakeScale(1.3, 1.3)
//                    }, completion: { (Bool) -> Void in
////                        self.performSegueWithIdentifier("moodSegue", sender: self)
//                })
//                
//        }
    }
    @IBAction func didPressCard2(sender: AnyObject) {
        
        card3.bringSubviewToFront(self.card3)
        
//        UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//            
//            self.card3.transform = CGAffineTransformMakeScale(0.8, 0.8)
//            }) { (Bool) -> Void in
//                UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//                    self.card3.transform = CGAffineTransformMakeScale(1.3, 1.3)
//                    }, completion: { (Bool) -> Void in
//                        //                        self.performSegueWithIdentifier("moodSegue", sender: self)
//                })
//                
//        }
        
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
//            self.card3.center.y = self.card3.center.y - 350
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//                    self.card3.transform = CGAffineTransformMakeScale(1.3, 1.3)
                    }, completion: { (Bool) -> Void in
                        //                        self.performSegueWithIdentifier("moodSegue", sender: self)
                })
                
        }
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        var destinationViewController = segue.destinationViewController as ContactsViewController
//        
//        fadeTransition = FadeTransition()
//        fadeTransition.duration = 0.5
//        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
//        destinationViewController.transitioningDelegate = fadeTransition
//        
//    }

    
    
//    @IBAction func didPan(sender: UIPanGestureRecognizer) {
//        var location = sender.locationInView(view)
//        var translation = sender.translationInView(view)
//        var velocity = sender.velocityInView(view)
//        
//        if (sender.state == UIGestureRecognizerState.Began) {
//            cardPanBegan = card1.center.y
//            
//        } else if(sender.state == UIGestureRecognizerState.Changed) {
//            println(translation.y)
//            finalCardPosition = cardPanBegan + translation.y
//            card1.center.y = finalCardPosition
//            
//        } else if(sender.state == UIGestureRecognizerState.Ended) {
//            
//            if (card1.center.y > originalCardPos + 60) {
//                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 15, options: nil, animations: { () -> Void in
//                    self.card1.frame.origin.y = -600
//                    }, completion: nil)
//            }
//        }
//    }
//    
//    //Allow panning and scrolling on the same objects
//    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
//        return true
//    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
