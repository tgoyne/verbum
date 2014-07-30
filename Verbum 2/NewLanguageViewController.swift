//
//  NewLanguageViewController.swift
//  Verbum 2
//
//  Created by Peter on 25/07/14.
//  Copyright (c) 2014 Peter Tikhomirov. All rights reserved.
//

import UIKit
import Realm

class NewLanguageViewController: UIViewController, UITextFieldDelegate {
	
	let db = DBManager()
	let realm = RLMRealm.defaultRealm()
	
	@IBOutlet weak var languageTitle: UITextField!
	
	@IBAction func cancelSave(sender: AnyObject) {
		dismissViewControllerAnimated(true, completion: nil)
	}
	
	@IBAction func saveData(sender: AnyObject) {
		realm.beginWriteTransaction()
//		var allObjects = Language.allObjects()
//		var newPosition:Int
//		if allObjects.count > 0 {
//			newPosition = allObjects.maxOfProperty("position") as Int
//		} else {
//			newPosition = 0
//		}
		Language.createInRealm(realm, withObject: [languageTitle.text])
		realm.commitWriteTransaction()
		self.view.endEditing(true)
		dismissViewControllerAnimated(true, completion: nil)
	}
	
//	override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
//		self.view.endEditing(true)
//	}
	
	func textFieldShouldReturn(textField: UITextField!) -> Bool {
		textField.resignFirstResponder()
		return true
	}

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
