//
//  AvatarFriendCollectionViewController.swift
//  Client VK
//
//  Created by Максим Борисенко on 14.04.2022.
//  Copyright © 2022 Maxim Borisenko. All rights reserved.
//

import UIKit

class PhotosFriendCollectionViewController: UICollectionViewController {
    
    var collectionPhotos: [UIImage?] = []
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionPhotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosFriendCell", for: indexPath) as! PhotosFriendCollectionViewCell
        
        let photo = collectionPhotos[indexPath.row]
        cell.photosFrienndImage.image = photo
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showUserPhoto"{
            
            guard let photosFriend = segue.destination as? FriendsPhotosViewController else { return }
            
            if let indexPath = collectionView.indexPathsForSelectedItems?.first {
                photosFriend.allPhotos = collectionPhotos
                photosFriend.countCurentPhoto = indexPath.row
                
            }
        }
    }
    
    
    
}
