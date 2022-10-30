//
//  BottleBrain.swift
//  Bottle game
//
//  Created by Nikolai Kolmykov on 17.10.2022.
//

import Foundation
import UIKit

struct BottleBrain{
    
    let rotaterArray: [Double] = [0.2, 0.55, 0.8]
    let rotatePiCount = [1,2]
    let namesImage = ["Игорь","Даня","Никита"]
    var calls: [String] = []
    
    func rotateView(targetView: UIView, duration: Double = 0.5, ImageView: UIImageView) ->  Int {
        
        var randomSpinPiCoount: Int = 0
        var randomDoubleNumber: Double = 0
        //var boolReturn = false
        
        UIView.animate(withDuration: 3, animations: {
            for _ in 0...5{
                targetView.transform = CGAffineTransform.identity
                
                randomSpinPiCoount = self.rotatePiCount.randomElement()!
                
                for _ in 1...randomSpinPiCoount{
                    targetView.transform = targetView.transform.rotated(by: .pi)
                }
                
                randomDoubleNumber = self.rotaterArray.randomElement()!
                targetView.transform = targetView.transform.rotated(by: .pi*randomDoubleNumber)
            }

            
            
        })
        
        return (expelledView(randomSpinPiCoount, randomDoubleNumber))
    }
    
    
    func expelledView(_ randomSpinPiCoount: Int,_  randomDoubleNumber: Double ) -> Int{
        switch randomSpinPiCoount{
        case 1:
            switch randomDoubleNumber{
            case 0.2:
                return 5
            case 0.55:
                return 6
            case 0.8:
                return 7
            default:
                return 4
            }
        default:
            switch randomDoubleNumber{
            case 0.2:
                return 1
            case 0.55:
                return 2
            case 0.8:
                return 3
            default:
                return 0
            }
        }
    }
    

    mutating func giveRandomNameImage() -> String{
        let b = namesImage.randomElement()!
        calls.append(b)
        return b
    }
    
   
}
