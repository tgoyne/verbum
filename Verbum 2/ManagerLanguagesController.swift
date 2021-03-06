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
	///override var description: String { return "Cell with position \(position)" }
	init(style: UITableViewCellStyle, reuseIdentifier: String!) {
		super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
		
	}
}

class ManagerLanguagesController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
	var array = RLMArray()
	var notificationToken: RLMNotificationToken?
	var editButton = UIBarButtonItem()
    var languageList : LanguageList?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let realm = RLMRealm.defaultRealm()

        // Create the list of languages if it does not exist yet
        self.languageList = LanguageList.allObjectsInRealm(realm).firstObject() as LanguageList!
        if !self.languageList {
            self.languageList = LanguageList()
            realm.beginWriteTransaction()
            realm.addObject(self.languageList)
            realm.commitWriteTransaction()
        }

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
//		editButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "edit")
		editButton = UIBarButtonItem(title: "Edit", style: .Plain, target: self, action: "edit")
		var buttons = [addButton, editButton]
		
		self.navigationItem.rightBarButtonItems = buttons
	}
	
	func add() {
		var addLanguageView:UIViewController = self.storyboard.instantiateViewControllerWithIdentifier("newLanguage") as UIViewController
		self.navigationController.presentViewController(addLanguageView, animated: true, completion: nil)
	}
	
	func edit () {
		if tableView.editing {
			
//			var positionArray = NSMutableArray()
//			let realm = RLMRealm.defaultRealm()
//			var i = 0
//			
//			for var row = 0; row < tableView.numberOfRowsInSection(0); row++ {
//				var cellPath = NSIndexPath(forRow: row, inSection: 0)
//				var cell:Cell = tableView.cellForRowAtIndexPath(cellPath) as Cell
//				positionArray.addObject(cell.position)
//			}
//			//println(positionArray)
//			
//			realm.beginWriteTransaction()
////			for (index, row) in enumerate(array) {
//			for row: RLMObject in array {
////				var obj = array[UInt(index)] as Language
////				println(obj)
//				row["position"] = positionArray[i]
//				//println("index at position: \(positionArray[index])")
//				//println("index: \(index)")
//				//println("object: \(row)")
//				i++
//			}
//			realm.commitWriteTransaction()

			tableView.setEditing(false, animated: true)
			editButton.style = UIBarButtonItemStyle.Plain
			editButton.title = "Edit"
//			reloadData()
		} else{
			tableView.setEditing(true, animated: true)
			editButton.title = "Done"
			editButton.style =  UIBarButtonItemStyle.Done
//			reloadData()
		}
	}
	
 	override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
		let cell = tableView!.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as Cell
		
		let object = array[UInt(indexPath!.row)] as Language
		cell.textLabel.text = object.title
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
	
	override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
		return true
	}
	
	override func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!) {
		//	println("Old index: \(sourceIndexPath.indexAtPosition(sourceIndexPath.length - 1)+1)")
		//	println("New index: \(destinationIndexPath.indexAtPosition(sourceIndexPath.length - 1)+1)")
		let object = array.objectAtIndex(UInt(sourceIndexPath.row)) as Language
		let realm = RLMRealm.defaultRealm()
		realm.beginWriteTransaction()
		array.removeObjectAtIndex(UInt(sourceIndexPath.row))
		array.insertObject(object, atIndex: UInt(destinationIndexPath.row))
		realm.commitWriteTransaction()
	}

	func reloadData() {
		array = self.languageList!.languages
		tableView.reloadData()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

}
