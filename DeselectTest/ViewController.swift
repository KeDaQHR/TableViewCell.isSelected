//
//  ViewController.swift
//  DeselectTest
//
//  Created by Ke Ma on 2018-12-03.
//  Copyright © 2018 Ke Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var tableView: UITableView!
	@IBAction func tapped(_ sender: Any) {
		shoudSelect = true
		tableView.reloadData()
	}
	
	var shoudSelect = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		tableView.dataSource = self
		tableView.delegate = self
		tableView.allowsMultipleSelection = true
	}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
		cell.textLabel?.text = "\(indexPath.row)"
		return cell
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		if shoudSelect {
			cell.setSelected(true, animated: true)
		}
	}
	
	func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		print("will select \(indexPath.row)")
		return indexPath
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("did select \(indexPath.row)")
	}
	
	func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
		print("will deselect \(indexPath.row)")
		return indexPath
	}
	
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		print("did deselect \(indexPath.row)")
	}
}

