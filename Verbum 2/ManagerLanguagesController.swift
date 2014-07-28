//
//  ManagerLanguagesController.swift
//  Verbum 2
//
//  Created by Peter on 25/07/14.
//  Copyright (c) 2014 Peter Tikhomirov. All rights reserved.
//

import UIKit
import Realm

class Cell: UITableViewCell {
	
	init(style: UITableViewCellStyle, reuseIdentifier: String!) {
		super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
	}
}

class ManagerLanguagesController: UITableViewController {
	
	var array = RLMArray()
	var notificationToken: RLMNotificationToken?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupUI()
		notificationToken = RLMRealm.defaultRealm().addNotificationBlock { note, realm in
			self.reloadData()
		}
		reloadData()
    }

	override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
		return Int(array.count)
	}
	
	func setupUI() {
		tableView.registerClass(Cell.self, forCellReuseIdentifier: "cell")
		self.title = "Languages"
		
		var addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "add")
		var editButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "edit")
		var buttons = [addButton, editButton]
		
		self.navigationItem.rightBarButtonItems = buttons
	}
	
	func add() {
		var addLanguageView:UIViewController = self.storyboard.instantiateViewControllerWithIdentifier("newLanguage") as UIViewController
		self.navigationController.presentViewController(addLanguageView, animated: true, completion: nil)
	}
	
	func edit() {
	
	}
	
 	override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
		let cell = tableView!.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as Cell
		
		let object = array[UInt(indexPath!.row)] as Language
		cell.textLabel.text = object.title
		//cell.detailTextLabel.text = Stringobject.position
		return cell
	}
	
	override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
		if editingStyle == .Delete {
			let realm = RLMRealm.defaultRealm()
			realm.beginWriteTransaction()
			realm.deleteObject(array[UInt(indexPath.row)] as RLMObject)
			realm.commitWriteTransaction()
		}
	}
	
	func reloadData() {
		array = Language.allObjects().arraySortedByProperty("position", ascending: true)
		tableView.reloadData()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

}
