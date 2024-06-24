//
//  Home.swift
//  Notas
//
//  Created by Lean on 24/06/2024.
//

import SwiftUI

struct Home: View {
    
    @StateObject var model = ViewModel()
    
    
    var body: some View {
        Button(action: {
            model.show.toggle()
        }){
            Text("+")
        }.sheet(isPresented: $model.show, content: {
            addView(model: model)
        })
    }
}

#Preview {
    Home()
}
