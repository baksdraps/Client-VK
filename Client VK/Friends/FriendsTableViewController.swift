//
//  FriendsTableViewController.swift
//  Client VK
//
//  Created by Максим Борисенко on 22.04.2022.
//  Copyright © 2022 Maxim Borisenko. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        makeNamesList()
        sortCharacterOfNamesAlphabet()
    }
    
    let friendsList = [
        User(userName: "Колян Работа",
             userAvatar: (UIImage(named: "person1")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person3"), UIImage(named: "person4"), UIImage(named: "person5")]),
        User(userName: "Юра",
             userAvatar: (UIImage(named: "person2")),
             userPhotos: [UIImage(named: "person5"), UIImage(named: "person3"), UIImage(named: "person2")]),
        User(userName: "Альбина Василюк",
             userAvatar: (UIImage(named: "person3")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person4")]),
        User(userName: "Каха или каша",
             userAvatar: (UIImage(named: "person4")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person3")]),
        User(userName: "Сергей Александрович",
             userAvatar: (UIImage(named: "person5")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person5")]),
        User(userName: "BRP",
             userAvatar: (UIImage(named: "person2")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person5")]),
        User(userName: "Серый Вороб",
             userAvatar: (UIImage(named: "person5")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person3")]),
        User(userName: "Храпов Антон",
             userAvatar: (UIImage(named: "person3")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person4"), UIImage(named: "person5")]),
        User(userName: "Правозащита",
             userAvatar: (UIImage(named: "person4")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person4"), UIImage(named: "person3"), UIImage(named: "person5")]),
        User(userName: "Иван Серов",
             userAvatar: (UIImage(named: "person2")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person3"), UIImage(named: "person5")]),
        User(userName: "Дрофа",
             userAvatar: (UIImage(named: "person2")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person3"), UIImage(named: "person5")]),
        User(userName: "Ломбарл",
             userAvatar: (UIImage(named: "person2")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person3"), UIImage(named: "person5")]),
        User(userName: "Самойлов",
             userAvatar: (UIImage(named: "person2")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person3"), UIImage(named: "person5")]),
        User(userName: "Андреевна",
             userAvatar: (UIImage(named: "person2")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person3"), UIImage(named: "person5")]),
        User(userName: "Толстый",
             userAvatar: (UIImage(named: "person2")),
             userPhotos: [UIImage(named: "person1"), UIImage(named: "person3"), UIImage(named: "person5")])
    ]
    
    var namesListFixed: [String] = []
    var namesListModifed: [String] = []
    var letersOfNames: [String] = []
    
    func makeNamesList() {
        namesListFixed.removeAll()
        for item in 0...(friendsList.count - 1){
            namesListFixed.append(friendsList[item].userName)
        }
        namesListModifed = namesListFixed
    }
    
    func sortCharacterOfNamesAlphabet() {
        var letersSet = Set<Character>()
        letersOfNames = [] 
        for name in namesListModifed {
            letersSet.insert(name[name.startIndex])
        }
        // заполнение массива строк из букв имен
        for leter in letersSet.sorted() {
            letersOfNames.append(String(leter))
        }
    }
    
    func getNameFriendForCell(_ indexPath: IndexPath) -> String {
        var namesRows = [String]()
        for name in namesListModifed.sorted() {
            if letersOfNames[indexPath.section].contains(name.first!) {
                namesRows.append(name)
            }
        }
        return namesRows[indexPath.row]
    }
    
    func getAvatarFriendForCell(_ indexPath: IndexPath) -> UIImage? {
        for friend in friendsList {
            let namesRows = getNameFriendForCell(indexPath)
            if friend.userName.contains(namesRows) {
                return friend.userAvatar
            }
        }
        return nil
    }
    
    func getPhotosFriend(_ indexPath: IndexPath) -> [UIImage?] {
        var photos = [UIImage?]()
        for friend in friendsList {
            let namesRows = getNameFriendForCell(indexPath)
            if friend.userName.contains(namesRows) {
                photos.append(contentsOf: friend.userPhotos)
                //return friend.userPhotos
            }
        }
        return photos
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        namesListModifed = searchText.isEmpty ? namesListFixed : namesListFixed.filter { (item: String) -> Bool in
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        sortCharacterOfNamesAlphabet()
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = nil
        makeNamesList()
        sortCharacterOfNamesAlphabet()
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return letersOfNames.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        let leter: UILabel = UILabel(frame: CGRect(x: 30, y: 5, width: 20, height: 20))
        leter.textColor = UIColor.black.withAlphaComponent(0.5)
        leter.text = letersOfNames[section]
        leter.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        header.addSubview(leter)
        
        return header
    }
    
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return letersOfNames
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countOfRows = 0
        
        for name in namesListModifed {
            if letersOfNames[section].contains(name.first!) {
                countOfRows += 1
            }
        }
        return countOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsTableViewCell
        
        cell.nameFriendLabel.text = getNameFriendForCell(indexPath)
        cell.avatarFriendView.avatarImage.image = getAvatarFriendForCell(indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showListUsersPhoto"{
            
            guard let photosFriend = segue.destination as? PhotosFriendCollectionViewController else { return }
            
            if let indexPath = tableView.indexPathForSelectedRow {
                photosFriend.title = getNameFriendForCell(indexPath)
                
                photosFriend.collectionPhotos = getPhotosFriend(indexPath)
                
            }
        }
    }
    
}
