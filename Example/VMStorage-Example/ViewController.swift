//
//  ViewController.swift
//  VMStorage-Example
//
//  Created by Vasco Mouta on 26.02.17.
//  Copyright © 2017 zucred AG. All rights reserved.
//

import UIKit
import FirebaseStorage
import VMLogger
import SDWebImage

class ViewController: UIViewController {

    //public let logger = AppLogger.logger(ViewController.name())

    @IBOutlet var imageView: UIImageView!

    lazy var storageRef: FIRStorageReference! = {
        return FIRStorage.storage().reference()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let filePath = "file:\(documentsDirectory)/myimage.jpg"
        guard let fileURL = URL.init(string: filePath) else { return }
        
        storageRef = FIRStorage.storage().reference()
        storageRef.metadata(completion: { metaData, error in
            guard error == nil else { print(error); return }
            print(metaData)
        })
        storageRef.child("viktorina-kapitonova-and-manuel-renard-6.jpg").write(toFile: fileURL, completion: { (url, error) in
            if let error = error {
                print("Error downloading:\(error)")
            } else if let imagePath = url?.path {
                print("Download Succeeded:\(imagePath)")
            }
        })
        
        _ = storageRef.child("viktorina-kapitonova-and-manuel-renard-6.jpg").metadata(completion: { metaData, error in
            guard error == nil else { print(error); return }
            self.imageView.sd_setImage(with: metaData?.downloadURL(), placeholderImage: nil)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

