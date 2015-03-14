//
//  CardViewController.swift
//  Impromptu
//
//  Created by Scott Tong on 3/14/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

	@IBOutlet weak var yesOrNoLabel: UILabel!
	@IBOutlet weak var topCard: UIView!
	
	var topCardStartingPosition: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		topCardStartingPosition = topCard.center
		yesOrNoLabel.hidden = true
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func didPan(sender: AnyObject) {
		var translation = sender.translationInView(view)
		
		if (sender.state == UIGestureRecognizerState.Began){
			topCardStartingPosition = topCard.center
		}
		

		else if (sender.state == UIGestureRecognizerState.Changed) {
			// move the view
			topCard.center = CGPointMake(topCardStartingPosition.x + translation.x, topCardStartingPosition.y + translation.y)

			// rotate the view
			topCard.transform = CGAffineTransformMakeRotation(translation.x/10 * CGFloat(M_PI/180))
			
			// swipe right
			if topCard.center.x > view.bounds.width/2 + 100 {
				self.yesOrNoLabel.textColor = UIColor.greenColor()
				self.yesOrNoLabel.text = "YEP"
				self.yesOrNoLabel.hidden = false
			}
			//swipe left
			else if  topCard.center.x < view.bounds.width/2 - 100 {
				self.yesOrNoLabel.textColor = UIColor.redColor()
				self.yesOrNoLabel.text = "NOPE"
				self.yesOrNoLabel.hidden = false
			}
				
			// didn't swipe far enough
			else {
				self.yesOrNoLabel.hidden = true
			}

			
			println("is panning")
		}
			
		else if (sender.state == UIGestureRecognizerState.Ended) {
			// swipe right
			if topCard.center.x > view.bounds.width/2 + 100 {
				UIView.animateWithDuration(0.4, animations: { () -> Void in
					self.topCard.center.x = self.view.bounds.width * 2
				})
				
			//swipe left
			} else if  topCard.center.x < view.bounds.width/2 - 100 {
				UIView.animateWithDuration(0.4, animations: { () -> Void in
					self.topCard.center.x = -self.view.bounds.width * 2
				})
			}
			
			// didn't swipe far enough
			else {
				UIView.animateWithDuration(0.2, animations: { () -> Void in
					self.topCard.center = CGPointMake(self.view.bounds.width/2, self.view.bounds.height/2)
					self.topCard.transform = CGAffineTransformMakeRotation(0)

				})
			}
			
		}
	}

	@IBAction func resetButton(sender: AnyObject) {
		
		self.topCard.center = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
		self.topCard.transform = CGAffineTransformMakeRotation(0)
		self.yesOrNoLabel.hidden = true

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
