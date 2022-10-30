//
//  ViewController.swift
//  Bottle game
//
//  Created by Nikolai Kolmykov on 17.10.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var workItem: DispatchWorkItem?

        
    @IBOutlet weak var bottleImage: UIImageView!
    @IBOutlet var collectionImages:[UIImageView]!
    
    var bottleBrain = BottleBrain()
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionImages.forEach{ i in
            i.image = UIImage(named: bottleBrain.giveRandomNameImage())
        }

    }
    
    
    @IBAction func spinButton(_ sender: UIButton) {
        
        let a = bottleBrain.rotateView(targetView: bottleImage, ImageView: bottleImage)
        
        if workItem != nil {
            workItem?.cancel()
        }
        
        workItem = DispatchWorkItem {
            self.alert(title: self.bottleBrain.calls[a], message: "Отчислен", preferredStyle: .alert)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: workItem!)
    }
    
    
    
    
    func alert(title: String , message: String , preferredStyle: UIAlertController.Style){
        
        let createAlert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let createAlertButton = UIAlertAction(title: "Ок", style: .cancel)
        createAlert.addAction(createAlertButton)
        
        self.present(createAlert, animated: true, completion: nil)
        
    }
    
}




