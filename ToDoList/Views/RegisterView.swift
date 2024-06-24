//
//  RegisterView.swift
//  ToDoList
//
//  Created by Ryan Montoyo on 6/21/24.
//

import SwiftUI



struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()

    
    var body: some View {
        VStack{
            HeaderView(title: "Register",
                       subtitle: "Start Organizing To Dos",
                       rotation: -15,
                       background: .orange)
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                SecureField("Password (6+ characters)", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", background: .green){
                    //attempt registration
                    viewModel.register()
                }
                    .padding()
                
            }
            .offset(y: -50)
            
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
