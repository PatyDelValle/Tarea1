//
//  ViewController.swift
//  semana5Clases
//
//  Created by patricia on 3/1/19.
//  Copyright © 2019 patricia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    let user = "Paty"
    let password = "123"
    
    let estudiante = Estudiante(nombre: "Paty", carrera: "Compu", nombreImagen: "imgpaty")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Animaciones con recorrido de vistas
        UIView.animate(withDuration: 0.75) {
            self.titleLabel.center.x = self.view.center.x
            //self.userTextField.center.x = self.view.center.x
            //self.passwordTextField.center.x = self.view.center.x
            }
        
        UIView.animate(withDuration: 0.75, delay: 0.3, options: [], animations: {
            self.userTextField.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 0.75, delay: 0.5, options: [], animations: {
            self.passwordTextField.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0, options:.autoreverse, animations: {
            self.loginButton.alpha = 1.0
            }, completion: nil)
        UIView.animate(withDuration: 1.75, delay: 0, options: .repeat, animations: {
            self.registerButton.alpha = 1.0
        }, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userTextField.text = ""
        passwordTextField.text = ""
        view.endEditing(false)
        
        //animaciones
        //1. recorrer el titulo a la izquierda
        
        //titleLabel.center.x -= view.frame.origin.x
        titleLabel.frame.origin.x = view.frame.origin.x  - titleLabel.frame.size.width
        userTextField.frame.origin.x = view.frame.origin.x - userTextField.frame.size.width
        passwordTextField.frame.origin.x = view.frame.origin.x - passwordTextField.frame.size.width

    }
    
    func setupUI(){
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.backgroundColor = UIColor.mainPink()
        loginButton.layer.cornerRadius = 10.0
    
        //button register
        registerButton.setTitleColor(UIColor.mainPink(), for:   .normal)
        
        let imageView = UIImageView(image: UIImage(named: "bg-sunny"))
        imageView.frame = self.view.bounds
        
        //enviarlo al fondo indice = 0
        self.view.insertSubview(imageView, at: 0)
        loginButton.alpha = 0.0 //para que en la animacion se mueva a 1
        registerButton.alpha = 0.0
    }
    
    
    @IBAction func hiddenkeyboard(_ sender: UITapGestureRecognizer) {
        //Esconder el teclado
        view.endEditing(true)
    }
    

    @IBAction func logIn(_ sender: UIButton) {
        if userTextField.text == user && passwordTextField.text == password {

            //            performSegue(withIdentifier: "LoginSegue", sender: self)se quita por que quitamos el segue
            
        //quitamos el segue y vamos a instanciar la clase a donde vamos
            // en este caso al profile
            //estamos en el main , por ello self hace referencia al main
            //aqui le decimos que desde el main va al profile
            //para asegurar que existe el congtrolador lo clocamos en un if
            //profile es la vista, y ProfileViewController es su controlador
            
            if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "profile") as? ProfileViewController {
                
                nextVC.estudiante = estudiante
                
                //CREANDO UN navigation y le pasa el viewControleer
            let navigationController = UINavigationController(rootViewController: nextVC)
                
                self.present(navigationController, animated: true, completion: nil)
            }
            
            
        }
        else {
            if (userTextField.text != user ) {
                //1. CREAR ALERTA
            let alert = UIAlertController(title: "Usuario incorrecto", message: "Usuario incorrecto", preferredStyle: .alert) // .alert)
            
            // 2.  crean las acciones,Se agregan botones de acciones
            
            //se crea la segunda accion style: .default o style: .destructive
            //CLOUSURE asincrono, ya que es un evento el ok , se ejecuta la funcion y cierra la vista
            //hasta que se presione OK
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
            
            //tercer paso presentar la alerta
            present(alert, animated: true, completion: nil)
            }
            else {
                passwordTextField.textColor = .red
                //1. SE CREA ALERTA
                let alert = UIAlertController(title: "Password incorrecto", message: "Password incorrecto", preferredStyle: .alert) // .alert)
                
                //2. se crea la accion style: .default o style: .destructive
                alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
                
                //3. presentar la alerta
                present(alert, animated: true, completion: nil)
            }
        }
    }
}
