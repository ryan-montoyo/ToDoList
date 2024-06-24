//
//  LoginView.swift
//  ToDoList
//
//  Created by Ryan Montoyo on 6/21/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List",
                           subtitle: "Get Things Done",
                           rotation: 15,
                           background: .pink)
                
                
    
                //Login Form
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        HStack{
                            Image(systemName: "exclamationmark.circle")
                                .foregroundColor(.red)
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                        }
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                    
                    
                    TLButton(title: "Login", background: .blue){
                        //attempt login
                        viewModel.login()
                    }
                        .padding()
                }
                
                //Create Account
                VStack{
                    Text("New around here?")
                    
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
