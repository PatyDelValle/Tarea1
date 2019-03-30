//
//  RegiosterViewController.swift
//  semana5Clases
//
//  Created by patricia on 3/1/19.
//  Copyright © 2019 patricia. All rights reserved.
//

import UIKit

class RegiosterViewController: UIViewController {

    @IBOutlet weak var registrerColor: UIButton!
    @IBOutlet weak var correoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Register"
        setupUI()
        
    }
    func setupUI(){
        registrerColor.setTitleColor(UIColor.white, for: .normal)
        registrerColor.backgroundColor = UIColor.mainPink()
        registrerColor.layer.cornerRadius = 5.0
        
        //activar el teclado
        correoTextField.becomeFirstResponder()
    }


    @IBAction func hiddenKeyboard(_ sender: UITapGestureRecognizer) {
        //Esconder el teclado
        view.endEditing(true)
    }
    
}
