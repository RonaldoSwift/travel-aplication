//
//  travel_aplication2.swift
//  travel-aplication
//
//  Created by Ronaldo Andre Vargas Huaman on 18/03/21.
//

import SwiftUI


struct travel_aplication2: View {
    @State var buttonTocado = false
    @State var aumentoLikes = 0
    @Binding var showSheetView: Bool

    var servicios: [Servicio] = [
        Servicio(id: 0, nombre: "All", color: Color.black),
        Servicio(id: 1, nombre: "Overview", color: Color.black),
        Servicio(id: 2, nombre: "Hotels", color: Color.black),
        Servicio(id: 3, nombre: "Food", color: Color.black),
        Servicio(id: 4, nombre: "Me", color: Color.black),
        Servicio(id: 5, nombre: "House", color: Color.black)]
    
    var body: some View {
        VStack{
            kdView()
            scrollesView()
            informacionView()
        }
        .edgesIgnoringSafeArea(.vertical)
    }
    
    func kdView() -> some View{
        return ZStack{
            Image("PIC")
                .resizable()
            VStack(alignment: .leading){
                buttonBackView()
                Spacer()
                HStack{
                    userView()
                    VStack{
                        Spacer()
                        heartButton()
                    }
                }
                .frame(height: 150)
                .padding()
            }
        }
        .frame(height: 400)
    }
    
    func buttonBackView() -> some View{
        return Button(action: {
            showSheetView = false
        }, label: {
            Image("ArrowLeft")
                .resizable()
                .frame(width: 24, height: 24, alignment: .center)
            Text("Back")
                .foregroundColor(Color.black)
                .frame(width: 40, height: 100)
            
        })
        .font(.headline)
        .padding()
        .frame(width: 100, height: 60)
        .background(Color.white)
        .cornerRadius(20.0)
        .padding(13)
        .shadow(radius: 5)

    }
    func userView() -> some View{
        return  VStack(alignment: .leading){
            Text("Travel in West Asia")
                .font(.title)
                .bold()
                .foregroundColor(Color.white)
            Text("My trip to China in Beijin, where I stayed in a beatifull hotel called")
                .font(.title2)
                .foregroundColor(Color.white)
                .truncationMode(.tail)
                .lineLimit(2)
            HStack{
                
                Image("Mujer")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .leading)
                    .clipShape(Circle())
                
                Text("Leslie Alexander")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.headline)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
            
        }
    }
    func heartButton() -> some View{
        return Button(action: {
            aumentoLikes = aumentoLikes + 1
        }, label: {
            Image("Heart")
                .resizable()
                .font(.headline)
                .padding()
                .frame(width: 60, height: 60)
                .background(Color.white)
                .cornerRadius(20.0)
            
        })
    }
    
    
    func scrollesView() -> some View {
        return
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack{
                    ForEach(servicios, id: \.id){ servicio in
                        Button(action: {}, label: {
                                Text(servicio.nombre)
                                    .padding()
                                    .background(servicio.color)
                                    .cornerRadius(10)
                            
                        })
                        .shadow(radius: 5)
                    }
                }
            })
            .padding(10)
    }
    
    func informacionView() -> some View {
        return VStack(alignment: .leading){
            Text("At First")
                .font(.title)
                .bold()
                .padding()
            Text("Lets figure out how much I spent on this trip of money and time, and then the story begins")
                .font(.title2)
                .padding()
            HStack{
                Image(systemName: "mappin")
                Text("China")
                
                Image(systemName: "heart.fill")
                Text("\(aumentoLikes) likes")
                
                Image(systemName: "eye.fill")
                Text("1123 view")
            }
            .padding()
            
        }
    }
}

struct Servicio: Identifiable{
    var id: Int
    var nombre: String
    var color: Color
}

struct travel_aplication2_Previews: PreviewProvider {
    static var previews: some View {
        travel_aplication2( showSheetView: .constant(false))
    }
}
