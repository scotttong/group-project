//
//  ContactsViewController.swift
//  intro-tiles
//
//  Created by James De Angelis on 18/03/2015.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contactsContainer: UIView!
    @IBOutlet weak var selectedContact: UILabel!
    @IBOutlet weak var selectedContact2: UILabel!
    @IBOutlet weak var selectedContact3: UILabel!
    @IBOutlet weak var iconTick: UIImageView!
    @IBOutlet weak var iconTick2: UIImageView!
    @IBOutlet weak var invitesSent: UIImageView!
    @IBOutlet weak var blurBackground: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: 340, height: 516)
        iconTick.hidden = true
        iconTick2.hidden = true
        
        self.invitesSent.center.y = self.invitesSent.center.y + 188
        
        // Set the contactsContainer to off screen so it can be animated in
        contactsContainer.frame.origin.y = view.bounds.height + 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didInvite(sender: UITapGestureRecognizer) {
        invitesSent.alpha = 1
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: nil, animations: { () -> Void in
            self.contactsContainer.center.y = self.contactsContainer.center.y + 600
        }) { (Bool) -> Void in
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: nil, animations: { () -> Void in
                self.invitesSent.center.y = self.invitesSent.center.y - 188
            }, completion: { (Bool) -> Void in
                UIView.animateWithDuration(0.5, delay: 1.5, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: nil, animations: { () -> Void in
                    self.invitesSent.center.y = self.invitesSent.center.y + 188
                    }, completion: { (Bool) -> Void in
                        self.dismissViewControllerAnimated(true, completion: { () -> Void in
                            //
                        })
                })
            })
        }
    }
    
    
    @IBAction func didTapText(sender: UITapGestureRecognizer) {
        selectedContact.textColor = UIColor.blackColor()
    }
    
    @IBAction func contactsButton(sender: AnyObject) {
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveLinear, animations: { () -> Void in
            self.selectedContact2.textColor = UIColor.blackColor()
            self.iconTick.hidden = false
            }) { (Bool) -> Void in
                //
        }
    }
    
    @IBAction func contactsButton2(sender: AnyObject) {
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveLinear, animations: { () -> Void in
            self.selectedContact3.textColor = UIColor.blackColor()
            self.iconTick2.hidden = false
            }) { (Bool) -> Void in
                //
        }
    }
    
    func gestureRecognizer(UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
            return true
    }

    @IBAction func didTapCloseButton(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
            //
        })
    }
    
    override func viewWillAppear(animated: Bool) {
        //blur image view
        var lightBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var blurView = UIVisualEffectView(effect: lightBlur)
        blurView.frame = blurBackground.bounds
        blurBackground.addSubview(blurView)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 5, options: nil, animations: { () -> Void in
            self.contactsContainer.frame.origin.y = 85
            }) { (Bool) -> Void in
                //
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 5, options: nil, animations: { () -> Void in
            self.contactsContainer.frame.origin.y = self.view.bounds.height + 1
            }) { (Bool) -> Void in
                //
        }
    }
    override func viewDidDisappear(animated: Bool) {
        blurBackground.removeFromSuperview()
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
