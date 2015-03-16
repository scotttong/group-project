//
//  ViewController.swift
//  impromptu2
//
//  Created by Scott Silverman on 3/15/15.
//  Copyright (c) 2015 Scott Silverman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var card1ImageView: UIImageView!
    @IBOutlet weak var card2ImageView: UIImageView!
    @IBOutlet weak var card3ImageView: UIImageView!
    @IBOutlet weak var card4ImageView: UIImageView!
    @IBOutlet weak var card5ImageView: UIImageView!
    @IBOutlet weak var card6ImageView: UIImageView!
    @IBOutlet weak var card7ImageView: UIImageView!
    @IBOutlet weak var card8ImageView: UIImageView!
    
    var cards = [UIImageView]()
    var currentTopCardIndex: Int!
    var currentMiddleCardIndex: Int!
    var currentBottomCardIndex: Int!
    var topCardStartingPosition: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cards = [card1ImageView, card2ImageView, card3ImageView, card4ImageView, card5ImageView, card6ImageView, card7ImageView, card8ImageView]
        
        currentTopCardIndex = 0
        currentMiddleCardIndex = 1
        currentBottomCardIndex = 2
        
        setupTopCardView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupTopCardView() {
        println("starting setup | current card index: \(currentTopCardIndex)")
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "didPan:")
        cards[currentTopCardIndex].addGestureRecognizer(panGestureRecognizer)
        println("setup complete")
    }
    
    func advanceCardView() {
        currentTopCardIndex = currentTopCardIndex + 1
        currentMiddleCardIndex = currentMiddleCardIndex + 1
        currentBottomCardIndex = currentBottomCardIndex + 1
        setupTopCardView()
        UIView.animateWithDuration(0.2) { () -> Void in
            self.cards[self.currentTopCardIndex].frame = CGRect(x: 27, y: 91, width: 321, height: 466)
            self.cards[self.currentMiddleCardIndex].frame = CGRect(x: 37, y: 128, width: 301, height: 437)
        }
    }
    
    func didPan(sender: AnyObject) {
        
        var translation = sender.translationInView(view)
        var card = cards[currentTopCardIndex]
        
        if (sender.state == UIGestureRecognizerState.Began) {
            topCardStartingPosition = card.center
            println("pan began | \(topCardStartingPosition)")
            
        } else if (sender.state == UIGestureRecognizerState.Changed){
            // move the view
            card.center = CGPointMake(topCardStartingPosition.x + translation.x, topCardStartingPosition.y + translation.y)
            
            // rotate the view
            card.transform = CGAffineTransformMakeRotation(translation.x/10 * CGFloat(M_PI/180))
            
            // swipe right
            if card.center.x > view.bounds.width/2 + 100 {
//                self.yesOrNoLabel.textColor = UIColor.greenColor()
//                self.yesOrNoLabel.text = "YEP"
//                self.yesOrNoLabel.hidden = false
            }
                //swipe left
            else if  card.center.x < view.bounds.width/2 - 100 {
//                self.yesOrNoLabel.textColor = UIColor.redColor()
//                self.yesOrNoLabel.text = "NOPE"
//                self.yesOrNoLabel.hidden = false
            }
                
                // didn't swipe far enough
            else {
//                self.yesOrNoLabel.hidden = true
            }
            
        } else if (sender.state == UIGestureRecognizerState.Ended) {
            // swipe right
            if card.center.x > view.bounds.width/2 + 100 {
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    card.center.x = self.view.bounds.width * 2
                })
                advanceCardView()
                
                //swipe left
            } else if  card.center.x < view.bounds.width/2 - 100 {
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    card.center.x = -self.view.bounds.width * 2
                })
                advanceCardView()
            }
                
                // didn't swipe far enough
            else {
                UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 15, options: nil, animations: { () -> Void in
                    card.center = self.topCardStartingPosition
                    card.transform = CGAffineTransformMakeRotation(0)
                }, completion: { (Bool) -> Void in
                    //
                })
            }
        }
    }
}

