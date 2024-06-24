//
//  ViewModel.swift
//  Notas
//
//  Created by Lean on 24/06/2024.
//

import Foundation
import CoreData
import SwiftUI


class ViewModel: ObservableObject {
    @Published var nota = ""
    @Published var fecha = Date()
    @Published var show = false
    @Published var updateItem : Notas!
    
    
    
    //core data
    
    //guardar los datos
    func saveData(context: NSManagedObjectContext){
        let newNota = Notas(context: context)
        newNota.nota = nota
        newNota.fecha = fecha
        
        do{
            try context.save()
            print("Se guardo")
            show.toggle()
        }catch let error as NSError {
            //alerta para el usuario
            print("No se guardo", error.localizedDescription)
        }
    }
    
    
    //eliminar los datos
    func deleteData(item: Notas, context: NSManagedObjectContext){
        context.delete(item)
        //try! context.save()
        
        do{
            try context.save()
            print("Se Elimino")
        }catch let error as NSError {
            //alerta para el usuario
            print("No se elimino", error.localizedDescription)
        }
        
    }
    
    //enviar los datos para editar
    func sendData(item: Notas){
        updateItem = item
        nota = item.nota ?? ""
        fecha = item.fecha ?? Date()
        show.toggle()
    }
    
    //editar los datos
    func editData(context: NSManagedObjectContext){
        updateItem.fecha = fecha
        updateItem.nota = nota
        
        do{
            try context.save()
            print("se actualizo")
            show.toggle()
        }catch let error as NSError{
            //alerta para el usuario
            print("No se Edito", error.localizedDescription)
        }
        
        
    }
    
    
    
}
