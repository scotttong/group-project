
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
    
	var tilesViewController: TilesViewController!
	var bgcolor: UIColor!
    
    //Card globals
    var cardPanBegan : CGFloat!
    var finalCardPosition: CGFloat!
    var originalCardPos: CGFloat!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		moodBackgroundColor.backgroundColor = bgcolor
        
        // Set the scroll view to the amount of cards + gutter
        cardScrollView.contentSize = CGSize(width: card1.frame.width * 3 + 40, height: card1.frame.height)

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
    
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if (sender.state == UIGestureRecognizerState.Began) {
            cardPanBegan = card1.center.y
            
        } else if(sender.state == UIGestureRecognizerState.Changed) {
            println(translation.y)
            finalCardPosition = cardPanBegan + translation.y
            card1.center.y = finalCardPosition
            
        } else if(sender.state == UIGestureRecognizerState.Ended) {
            
            if (card1.center.y > originalCardPos + 60) {
                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 15, options: nil, animations: { () -> Void in
                    self.card1.frame.origin.y = -600
                    }, completion: nil)
            }
        }
    }
    
    //Allow panning and scrolling on the same objects
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
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
