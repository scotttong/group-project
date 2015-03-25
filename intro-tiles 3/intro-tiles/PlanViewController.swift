//
//  PlanViewController.swift
//  intro-tiles
//
//  Created by James De Angelis on 24/03/2015.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class PlanViewController: UIViewController {
    @IBOutlet var blackView: UIView!
    @IBOutlet var avatar1: UIImageView!
    @IBOutlet var avatar2: UIImageView!
    @IBOutlet weak var avatar2Accept: UIImageView!
    @IBOutlet weak var invitesSent: UIImageView!
    @IBOutlet weak var waitingLabel: UILabel!
    @IBOutlet weak var backArrow: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        blackView.alpha = 0.7
        waitingLabel.alpha = 0
        waitingLabel.center.y = waitingLabel.center.y + 30
        avatar1.transform = CGAffineTransformMakeScale(0.001, 0.001)
        avatar2.transform = CGAffineTransformMakeScale(0.001, 0.001)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: nil, animations: { () -> Void in
            self.invitesSent.center.y = self.invitesSent.center.y - 188
        }, completion: { (Bool) -> Void in
            UIView.animateWithDuration(0.5, delay: 1.5, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: nil, animations: { () -> Void in
                self.invitesSent.center.y = self.invitesSent.center.y + 188
                }, completion: { (Bool) -> Void in
            })
        })
        
        UIView.animateWithDuration(0.5, delay: 2, options: .CurveLinear, animations: { () -> Void in
            self.blackView.alpha = 0
        }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 2.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 8, options: nil, animations: { () -> Void in
            self.waitingLabel.alpha = 1
            self.waitingLabel.center.y = self.waitingLabel.center.y - 30
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 2.7, usingSpringWithDamping: 0.7, initialSpringVelocity: 8, options: nil, animations: { () -> Void in
            self.avatar1.transform = CGAffineTransformMakeScale(1, 1)
        }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 2.9, usingSpringWithDamping: 0.7, initialSpringVelocity: 8, options: nil, animations: { () -> Void in
            self.avatar2.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: nil)
    }
    
    @IBAction func didTapBack(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("backTile", sender: self)
    }
    @IBAction func didPress(sender: AnyObject) {
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 8, options: nil, animations: { () -> Void in
            self.avatar2Accept.alpha = 1
            self.avatar2.transform = CGAffineTransformMakeScale(1.15, 1.15)
            self.avatar2Accept.transform = CGAffineTransformMakeScale(1.15, 1.15)
        }) { (Bool) -> Void in
            UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 8, options: nil, animations: { () -> Void in
                self.avatar2.alpha = 0
                self.avatar2.transform = CGAffineTransformMakeScale(1, 1)
                self.avatar2Accept.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: nil)
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
