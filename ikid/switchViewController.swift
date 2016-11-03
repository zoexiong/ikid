//
//  switchViewController.swift
//  ikid
//
//  Created by Just on 16/11/3.
//  Copyright © 2016年 Just. All rights reserved.
//

import UIKit

class switchViewController: UIViewController {
    private var firstViewController : goodViewController!
    private var secondViewController : good2ViewController!
    
    private func firstBuilder(){
        if firstViewController == nil {
            storyboard?.instantiateViewController(withIdentifier:"first") as! goodViewController
        }
    }
    
    private func secondBuilder(){
        if secondViewController == nil {
            storyboard?.instantiateViewController(withIdentifier:"second") as! good2ViewController
        }
    }
    
    @IBAction func switchViews(sender: UIButton) {
        
        secondBuilder()
        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if firstViewController != nil &&
            firstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view,
                                          cache: true)
            secondViewController.view.frame = view.frame
            switchViewController(from: firstViewController, to:
                secondViewController)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view,
                                          cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(from: secondViewController, to:
                firstViewController)
        } }
    
    private func switchViewController(from: UIViewController?, to:
        UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        } }
    

///////


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
