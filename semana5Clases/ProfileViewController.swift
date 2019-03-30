//
//  ProfileViewController.swift
//  semana5Clases
//
//  Created by patricia on 3/1/19.
//  Copyright © 2019 patricia. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBOutlet weak var carreraLabel: UILabel!
    
    var estudiante = Estudiante()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    deinit {
        print ("El View controller es quitado de la memoria")
    }
    
    func setupUI () {
        //colocar titulo a la vista
        navigationItem.title = "Profile"
        
        //llamando a una funcion objective C
        //coloca un boton arriba derecha para salir de la vista (navegador)
        //con #selector ejecuta la funcion 
        let logOutButton = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logOut))
        navigationItem.rightBarButtonItem = logOutButton
        
        //ESTUDIANTE
        nombreLabel.text = estudiante.nombre
        carreraLabel.text = estudiante.carrera
        //UIImageVie.image =  UIImage(estudiante.nombreImagen))
        
    }
    
    /*
    @objc func logOut(){
        //para que se desaparezca y destruya
        self.dismiss(animated: true, completion: nil)
     
    }
 */
    @objc func logOut(){
        //para que se desaparezca y destruya
        //self.dismiss(animated: true, completion: nil)
        
        //1er paso crear la alerta preferredStyle: .alert o bien preferredStyle: .actionSheet
        //vamos a preguntar antes de salir, se crea el objeto  UIAlertController
        let alert = UIAlertController(title: "Cerrar sesion", message: "Estas seguro de salir", preferredStyle: .actionSheet) // .alert)
        
        // 2o paso se crean las acciones,Se agregan botones de acciones
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        //se crea la segunda accion style: .default o style: .destructive
        //CLOUSURE asincrono, ya que es un evento el ok , se ejecuta la funcion y cierra la vista
        //hasta que se presione OK
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        
        //tercer paso presentar la alerta
        present(alert, animated: true, completion: nil)
        
    }
}
