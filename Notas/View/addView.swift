//
//  addView.swift
//  Notas
//
//  Created by Lean on 24/06/2024.
//

import SwiftUI

struct addView: View {
    
    @ObservedObject var model: ViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack{
            Text(model.updateItem != nil ? "Editar Nota" :"Agregar Nota")
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            TextEditor(text: $model.nota)
            
            Divider()
            
            DatePicker("Seleccionar fecha", selection: $model.fecha)
            
            Spacer()
            
            Button(action: {
                if model.updateItem != nil {
                    model.editData(context: context)
                }else {
                    model.saveData(context: context)
                }
            }){
                Label(
                    title: { Text("Guardar").foregroundColor(.white).bold() },
                    icon: { Image(systemName: "plus").foregroundColor(.white).bold() }
)
            }.padding()
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(model.nota == "" ? Color.gray : Color.blue)
                .cornerRadius(8)
                .disabled(model.nota == "" ? true : false)
        }.padding()
    }
}

