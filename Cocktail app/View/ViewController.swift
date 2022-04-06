//
//  ViewController.swift
//  Cocktail app
//
//  Created by Aibek on 01.04.2022.
//

import UIKit
import TTGTagCollectionView


class ViewController: UIViewController, TTGTextTagCollectionViewDelegate {
    
    let collectionView = TTGTextTagCollectionView()
    let textField = UITextField(frame: CGRect(x: 10, y: 500, width: UIScreen.main.bounds.size.width - 20, height: 50.0))
    // the keyboard disappers when you tap return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //The keyboard disappears when you touch somewhere
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        
        
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor(white: 0.5, alpha: 0.3).cgColor
        textField.keyboardAppearance = .default
        textField.keyboardType = .default
        textField.placeholder = "Coctail name"
        textField.layer.shadowOpacity = 1
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.textAlignment = .center
        
        self.view.addSubview(textField)
        
        // Tag cloud code
        
        collectionView.alignment = .center
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        
        let config = TTGTextTagConfig()
        config.tagBackgroundColor = .mainGrey
        config.tagSelectedBackgroundColor = .mainRedandPurple
        config.tagTextColor = .white
        config.tagBorderColor = .lightGray
        config.tagBorderWidth = 1
        config.tagTextFont = UIFont.boldSystemFont(ofSize: 20)
        
        DataManager.getData {[weak self] items in
            guard let tags = items else {return}
            self?.collectionView.addTags(tags, with: config)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 300)
    }
}

extension ViewController: UITextFieldDelegate {
    private func handlerTextField() {
        textField.delegate = self
    }

}



