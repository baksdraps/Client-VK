//
//  GroupTableViewController.swift
//  Client VK
//
//  Created by Максим Борисенко on 14.04.2022.
//  Copyright © 2022 Maxim Borisenko. All rights reserved.
//

import UIKit

class GroupTableViewController: UITableViewController {
    
    var myGroups = [
        Group(groupName: "Jailbreak PS4/PS5. Все о прошивке Playstation", groupLogo: UIImage(named: "group1"))
    ]
    

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as! GroupTableViewCell
        
        cell.nameGroupLabel.text = myGroups[indexPath.row].groupName
        
        let avatar = myGroups[indexPath.row].groupLogo
        cell.avatarGroupView.avatarImage.image = avatar
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addNewGroup(segue:UIStoryboardSegue) {
        if segue.identifier == "AddGroup"{
        
            guard let newGroupFromController = segue.source as? NewGroupTableViewController else { return }
    
            if let indexPath = newGroupFromController.tableView.indexPathForSelectedRow {
           
                let newGroup = newGroupFromController.allGroups[indexPath.row]
                
                guard !myGroups.contains(newGroup) else { return }
                myGroups.append(newGroup)
                
                tableView.reloadData()
            }
        }
    }

}
