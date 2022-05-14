//
//  NewGroupTableViewController.swift
//  Client VK
//
//  Created by Максим Борисенко on 15.04.2022.
//  Copyright © 2022 Maxim Borisenko. All rights reserved.
//

import UIKit


class NewGroupTableViewController: UITableViewController {

    var allGroups = [
        Group(groupName: "Jailbreak PS4/PS5. Все о прошивке Playstation", groupLogo: UIImage(named: "group1")),
        Group(groupName: "Черный юмор", groupLogo: UIImage(named: "group2")),
        Group(groupName: "Рифмы и Панчи", groupLogo: UIImage(named: "group3")),
        Group(groupName: "Бешеные Панды Умирают Стоя", groupLogo: UIImage(named: "group4")),
        Group(groupName: "Кладбище цивилизации", groupLogo: UIImage(named: "group5"))
    ]

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddGroup", for: indexPath)  as! NewGroupTableViewCell

        cell.nameNewGroupLabel.text = allGroups[indexPath.row].groupName
        cell.avatarNewGroupView.avatarImage.image = allGroups[indexPath.row].groupLogo

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
