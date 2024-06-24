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
    
    
    
    //core data
    
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
    
}
