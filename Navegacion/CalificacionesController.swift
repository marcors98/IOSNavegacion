//
//  CalificacionesController.swift
//  Navegacion
//
//  Created by Alumno on 9/23/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import  UIKit

class CalificacionesController : UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tvMaterias: UITableView!
    var materias : [Materia] = []
    override func viewDidLoad() {
        materias.append(Materia(nombre: "Animaciòn", calificacionPrimerParcial: 8, calificacionSegundoParcial: 9, calificacionTercerParcial: 10, calificacionFinal: 9))
        materias.append(Materia(nombre: "Dispositivos Moviles", calificacionPrimerParcial: 9, calificacionSegundoParcial: 9, calificacionTercerParcial: 9, calificacionFinal: 9))
        materias.append(Materia(nombre: "Diosito", calificacionPrimerParcial: 10, calificacionSegundoParcial: 10, calificacionTercerParcial: 10, calificacionFinal: 10))
        materias.append(Materia(nombre: "Mèxico en el contexto global", calificacionPrimerParcial: 10, calificacionSegundoParcial: 10, calificacionTercerParcial: 9, calificacionFinal: 9))
    }
    
    //Numero de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Numero de filas por seccion
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materias.count
    }
    
    //Contenido de la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaMateria")
        celda?.textLabel?.text = materias[indexPath.row].nombre
        return celda!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetallesMateria" {
            let destino = segue.destination as? DetallesMateriaController
            destino?.materia = materias[tvMaterias.indexPathForSelectedRow!.row]
        }
    }
}
