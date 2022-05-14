//
//  Friends.swift
//  Client VK
//
//  Created by Максим Борисенко on 20.04.2022.
//  Copyright © 2022 Maxim Borisenko. All rights reserved.
//


import UIKit

struct User {
    let userName: String
    let userAvatar: UIImage?
    let userPhotos: [UIImage?]
}
//
//class FriendsList {
//    let friendsAll = [
//        User(userName: "Колян Работа",
//             userAvatar: (UIImage(named: "person1")),
//             userPhotos: [UIImage(named: "person1"), UIImage(named: "person2"), UIImage(named: "person3"), UIImage(named: "person4")]),
//        
//        User(userName: "Юра",
//             userAvatar: (UIImage(named: "person2")),
//             userPhotos: [UIImage(named: "person5"), UIImage(named: "person3"), UIImage(named: "person2")])
//    ]
//}

//class FriendsFacory {
//
//    let friendsList = [
//        "Колян Работа",
//        "Юра",
//        "Альбина Василюк",
//        "Каха или каша",
//        "Сергей Александрович",
//        "BRP",
//        "Серый Вороб",
//        "Храпов Антон",
//        "Иван Серов",
//        "Жена",
//        "Дрофа",
//        "Ломбард",
//        "Самойлов",
//        "Андреевна",
//        "Толстый"
//    ]
//
//    let avatarsFriendsList: [UIImage?] = [
//        UIImage(named: "person1"),
//        UIImage(named: "person2"),
//        UIImage(named: "person3"),
//        UIImage(named: "person4"),
//        UIImage(named: "person5")
//    ]
//
//    let photosFriendsList: [UIImage?] = [
//        UIImage(named: "person1"),
//        UIImage(named: "person2"),
//        UIImage(named: "person3"),
//        UIImage(named: "person4"),
//        UIImage(named: "person5")
//    ]
//
//    func makeFriendsList() -> [User] {
//        var usersList: [User] = []
//
//        for friend in friendsList {
//            let user = User(userName: friend,
//                            userAvatar: (avatarsFriendsList.randomElement()!!),
//                            userPhotos: [photosFriendsList.randomElement()!!, photosFriendsList.randomElement()!!, photosFriendsList.randomElement()!!, photosFriendsList.randomElement()!!, photosFriendsList.randomElement()!!, photosFriendsList.randomElement()!!])
//
//            usersList.append(user)
//        }
//
//        return usersList
//    }
//
// }
