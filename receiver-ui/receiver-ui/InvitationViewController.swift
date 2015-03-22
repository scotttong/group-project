//
//  InvitationViewController.swift
//  receiver-ui
//
//  Created by Scott Tong on 3/18/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class InvitationViewController: UIViewController {
	
	@IBOutlet weak var blackView: UIView!
	@IBOutlet weak var inviteCard: UIView!
	@IBOutlet weak var timerLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//		inviteCard.alpha = 1
		inviteCard.transform = CGAffineTransformMakeScale(0.001, 0.001)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func viewWillAppear(animated: Bool) {
		var lightBlur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
		var blurView = UIVisualEffectView(effect: lightBlur)
		blurView.frame = view.bounds
		blackView.addSubview(blurView)
	}
	
	override func viewDidAppear(animated: Bool) {
		//blur image view
		
	
		
		UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: nil, animations: { () -> Void in
//			self.blackView.alpha = 0.85
			self.inviteCard.transform = CGAffineTransformMakeScale(1, 1)
		}) { (Bool) -> Void in
			//
		}
	}
	
	
	override func viewWillDisappear(animated: Bool) {
		UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: nil, animations: { () -> Void in
			self.inviteCard.transform = CGAffineTransformMakeScale(0.001, 0.001)
			}) { (Bool) -> Void in
				//
		}
	}
	
	@IBAction func didPressDismissButton(sender: AnyObject) {
		dismissViewControllerAnimated(true, completion: nil)
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
