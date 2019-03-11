//
//  ViewController.swift
//  App
//
//  Created by Rafael Hernandez Almazan on 10/11/18.
//  Copyright © 2018 Rafael Hernandez Almazan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    
    var reminders: [Reminder] = []
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
    }

    
    @IBAction func addReminder(_ sender: UIBarButtonItem) {
        let alert = UIAlertController.init(title: "Panther Reminder", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Reminder"
        }
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction.init(title: "Save", style: .default, handler: { (_) in
            guard let reminderText = alert.textFields?.first?.text,!reminderText.isEmpty else {
                    return
            }
            self.reminders.append(Reminder(text: reminderText,completed: false))
            self.TableView.reloadData()
            
        }))
            present(alert, animated: true, completion: nil)
    }
    
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reminder = reminders[indexPath.item]
        let cell = UITableViewCell()
        
        cell.textLabel?.text = reminder.text
        
        if reminder.completed{
            cell.accessoryType = .checkmark
            cell.textLabel?.alpha = 0.5
        }else{
            cell.accessoryType = .none
            cell.textLabel?.alpha = 1.0
        }
        return cell
    }
    func   tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reminders[indexPath.item].toogleCompleted()
        tableView.reloadData()
        
    }
}
