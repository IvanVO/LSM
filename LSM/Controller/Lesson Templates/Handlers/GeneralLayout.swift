//
//  GeneralLayout.swift
//  LSM
//
//  Created by Ivan Villanueva on 13/05/21.
//  Copyright © 2021 Ivan Villanueva. All rights reserved.
//
import Foundation
import UIKit

class GeneralLayout {
    
    
    func questionLabel(question: String) -> UILabel{
        let thaQuestion = UILabel()
        
        thaQuestion.text = question
        thaQuestion.font = UIFont(name: "Arial", size: 20)
        thaQuestion.frame = CGRect(x: 20, y: 140, width: 374, height: 42)
        thaQuestion.textAlignment = .center
        
        return thaQuestion
    }
    
    func answerImage(whichImage: String, x:Int, y:Int, width:Int, height:Int) -> UIImageView {
        let thaImage = UIImageView()
        
        thaImage.image = UIImage(named: whichImage)
        thaImage.frame = CGRect(x: x, y: y, width: width, height: height)
        thaImage.contentMode = .scaleAspectFit
        
        return thaImage
    }
    
    func answerButton(x:Int, y:Int, width:Int, height:Int) -> UIButton {
        let thaButton = UIButton()
        
        thaButton.frame = CGRect(x: x, y: y, width: width, height: height)
        thaButton.addTarget(self, action: #selector(answerButtonAction(_:)), for: .touchUpInside)
        thaButton.layer.borderColor = CGColor(red: 61, green: 132, blue: 184, alpha: 0.5)
        thaButton.layer.borderWidth = 1
        
        return thaButton
    }
    
    @objc
    func answerButtonAction(_ sender:UIButton) {
        
        print("User touched the button.")
        sender.layer.borderColor = CGColor(red: 61, green: 132, blue: 184, alpha: 1)
        sender.layer.borderWidth = 1
    
    }
    
    func answerLabel(answer:String, x:Int, y:Int, width:Int, height:Int) -> UILabel {
        let thaLabel = UILabel()
        
        thaLabel.text = answer
        thaLabel.font = UIFont(name: "Arial", size: 17)
        thaLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        thaLabel.frame = CGRect(x: x, y: y, width: width, height: height)
        thaLabel.textAlignment = .center
        
        return thaLabel
    }
}
