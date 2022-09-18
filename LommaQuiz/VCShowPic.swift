//
//  VCShowPic.swift
//  LommaQuiz
//
//  Created by jörgen persson on 2022-09-17.
//

import UIKit
import FirebaseStorage

class VCShowPic: UIViewController {
    
    @IBOutlet weak var showLargePic: UIImageView!
    
    var URLString = ""
    let storage = Storage.storage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchImage()
        // Do any additional setup after loading the view.
    }
    
    private func fetchImage(){
   //     let pathReference = storage.reference(withPath: "alnarp/al.jpg")
        let pathReference = storage.reference(withPath: URLString)
        
        // Create a reference to the file you want to download
      //  let islandRef = storage.child("alnarp/al.jpg")

        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        pathReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
          if let error = error {
            // Uh-oh, an error occurred!
          } else {
            // Data for "images/island.jpg" is returned
          //  let image = UIImage(data: data!)
              self.showLargePic.image = UIImage(data: data!)
          }
        }
    }

}
