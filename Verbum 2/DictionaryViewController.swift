//
//  DictionaryViewController.swift
//  Verbum
//
//  Created by Peter on 21/07/14.
//  Copyright (c) 2014 Peter Tikhomirov. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController, SWRevealViewControllerDelegate {

	//@IBOutlet weak var revealButton: UIBarButtonItem!
	var revealButton = UIBarButtonItem()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		revealViewController().rearViewRevealWidth = 150 // Width of Drawer
		revealViewController().frontViewShadowOpacity = 0.5
		
		revealButton = UIBarButtonItem(barButtonSystemItem: .Done, target: revealViewController(), action: Selector("revealToggle:"))
		
		self.navigationItem.leftBarButtonItem = revealButton
		var rec:UIGestureRecognizer = revealViewController().panGestureRecognizer() as UIGestureRecognizer
		self.navigationController.navigationBar.addGestureRecognizer(rec)
    }
	
	func revealViewController(revealController: SWRevealViewController!, didMoveToPosition position: FrontViewPosition) {
		println("Menu moved!")
	}
	
	func revealViewController(revealController: SWRevealViewController!, willMoveToPosition position: FrontViewPosition) {
		println("Menu will be moved!")
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
	}

}
