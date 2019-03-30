//
//  estudiante.swift
//  semana5Clases
//
//  Created by patricia on 3/1/19.
//  Copyright © 2019 patricia. All rights reserved.
//

import Foundation
class Estudiante{
    var nombre = String()
    var carrera = String()
    var nombreImagen = String()
    
    init() {}
    init(nombre: String, carrera: String, nombreImagen: String){
    self.nombre = nombre
    self.carrera = carrera
    self.nombreImagen = nombreImagen
    }
    
}
