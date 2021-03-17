//
//  ContentView.swift
//  travel-aplication
//
//  Created by Ronaldo Andre Vargas Huaman on 15/03/21.
//


//
//  ContentView.swift
//  travel-aplication
//
//  Created by Ronaldo Andre Vargas Huaman on 15/03/21.
//

import SwiftUI


struct ContentView: View {
    var imagenesTab: [ImagenTab] = [
        ImagenTab(id: 0, eye: "AddedinReadList", image: "MainCardBG", nombre: "Travel to Africa", descripcion: "My trip to china started in Beijing, where | stayed in a beautiful hotel called ",image2: "Mujer", nombre2: "Leslie Alexander"),
        ImagenTab(id: 1, eye: "AddedinReadList", image: "MainCardBG", nombre: "Travel to Turkey", descripcion: "My trip to china started in Beijing, where | stayed in a beautiful hotel called ",image2: "Mujer", nombre2: "Leslie Alexander"),
        ImagenTab(id: 2, eye: "AddedinReadList", image: "MainCardBG", nombre: "Travel to Italy", descripcion: "My trip to china started in Beijing, where | stayed in a beautiful hotel called ",image2: "Mujer", nombre2: "Leslie Alexander"),
        ImagenTab(id: 3, eye: "AddedinReadList", image: "MainCardBG", nombre: "Travel to West", descripcion: "My trip to china started in Beijing, where | stayed in a beautiful hotel called ",image2: "Mujer", nombre2: "Leslie Alexande")
    ]
    var propiedadesNewArticles: [PropiedadNewArticle] = [
        PropiedadNewArticle(id: 0, image: "PrimerTab", nombre: "Africa"),
        PropiedadNewArticle(id: 1, image: "SegundoTab", nombre: "Turkey"),
        PropiedadNewArticle(id: 2, image: "TercerTab", nombre: "Italy"),
        PropiedadNewArticle(id: 3, image: "CuartoTab", nombre: "West")
    ]
    @State var username: String = ""
    @State private var index: Int = 0
    @State private var tapped: Bool = false
    
    var body: some View {
        ZStack{
            Color.orange
            VStack(spacing: 10){
                  readNowView()
                  newArticlesView()
                  labelTexView()
                  imagenesView()
                
                HStack(spacing: 0){
                    Pill(index: self.$index, tapped: $tapped, key: 0, label: "One")
                    Spacer()
                    Pill(index: self.$index, tapped: $tapped, key: 1, label: "Two")
                    Spacer()
                    Pill(index: self.$index, tapped: $tapped, key: 2, label: "Three")
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 28)
                .background(Color.black.opacity(0.2))
                .cornerRadius(40)
                .backgroundPreferenceValue(PillPreferenceKey1.self) { preferences in
                    GeometryReader { geometry in
                        self.createBackGround(geometry, preferences)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        
                    }
                }
            }
            .padding(.horizontal, 10)
            
        }
    }
    
    func readNowView() -> some View {
        return HStack{
            Image("Rectangulo70")
                .resizable()
                .frame(width: 55, height: 55)
            VStack(alignment:.leading){
                Text("Travel to Africa")
                    .font(.title2)
                    .foregroundColor(Color.black)
                HStack{
                    Image(systemName: "eye.fill")
                    Text("Added in Read List")
                }.foregroundColor(Color.orange)
            }
            Button(action: {print("xD")}, label: {
                Text("Read Now")
            })
            .foregroundColor(Color.black)
            .font(.title2)
        }
        .font(.headline)
        .padding(9)
        .frame(width: 365, height: 64)
        .background(Color.white)
        .cornerRadius(20.0)
        .padding(1)
    }
    
    func newArticlesView() -> some View{
        return VStack(alignment: .leading){
            Text("New Articles")
                .font(.title2)
                .padding()
                .frame(height: 17)
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack{
                    ForEach(propiedadesNewArticles, id: \.id){ propiedades in
                        ZStack{
                            Image(propiedades.image)
                                .resizable()
                                .frame(width: 90, height: 90)
                            Text(propiedades.nombre)
                                .foregroundColor(Color.white)
                        }
                    }
                }
            })
            
        }
    }
    
    func labelTexView() -> some View{
        return HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 25.02, height: 25.02)
                    .foregroundColor(Color.orange)
                ZStack(alignment: .leading) {
                        if username.isEmpty { Text("Your username").foregroundColor(.gray) }
                        TextField("", text: $username)
                            .foregroundColor(Color.black)
                    }
            }
            .font(.headline)
            .padding(10)
            .frame(width: 300, height: 45)
            .background(Color.white)
            .cornerRadius(20.0)
            
            HStack{
                Image("Filter")
                    .resizable()
                    .frame(width: 45, height: 45)
            }.font(.headline)
        }
    }
    
    
    func imagenesView() -> some View{
        return ScrollView(.horizontal, showsIndicators: false, content: {
            HStack{
                ForEach(imagenesTab, id: \.id){ imagenenTab in
                    ZStack{
                        Image(imagenenTab.image)
                            .resizable()
                        VStack{
                            HStack{
                                Image(imagenenTab.eye)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                Spacer()
                            }
                            Spacer()
                        }
                        descripcionDeViajeView(imagenenTab: imagenenTab)
                    }
                    .frame(width: 320)
                }
            }
        })
    }
    
    func descripcionDeViajeView(imagenenTab: ImagenTab ) -> some View {
        return VStack{
            Spacer()
            VStack(alignment: .leading){
                Text(imagenenTab.nombre)
                    .foregroundColor(Color.white)
                    .font(.title)
                    .bold()
                
                Text(imagenenTab.descripcion)
                    .foregroundColor(Color.white)
                    .font(.title2)
                    .lineLimit(2)
                    .truncationMode(.tail)
                HStack{
                    Image(imagenenTab.image2)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    Text(imagenenTab.nombre2)
                        .foregroundColor(Color.white)
                }
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 40))
        }
    }
    
    func createBackGround(_ geometry: GeometryProxy, _ preferences: [PillPreferenceData]) -> some View {
        let p = preferences
            .first(where: { $0.index == self.index })
        let bounds = p != nil ? geometry[p!.bounds] : .zero
        return RoundedRectangle(cornerRadius: 30)
            .foregroundColor(Color.blue)
            .frame(width: bounds.size.width, height: bounds.size.height)
            .fixedSize()
            .offset(x: bounds.minX, y: bounds.minY)
            .animation(.linear(duration: 0.2))
    }
}


struct Pill: View {
    @Binding var index: Int
    @Binding var tapped: Bool
    var key: Int
    var label: String
    
    var body: some View{
        Text(label)
            .fontWeight(.medium)
            .foregroundColor(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal,30)
            .clipShape(Capsule())
            .anchorPreference(key: PillPreferenceKey1.self, value: .bounds, transform: { [PillPreferenceData(index: self.key, bounds: $0)]
            })
            .onTapGesture {
                self.index = key
                self.tapped = true
            }
    }
}
struct PillPreferenceData {
    let index: Int
    let bounds: Anchor<CGRect>
}
struct PillPreferenceKey1: PreferenceKey {
    typealias Value = [PillPreferenceData]
    static var defaultValue: Value = []
    
    static func reduce(value: inout [PillPreferenceData], nextValue: () -> [PillPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}

struct PropiedadNewArticle: Identifiable{
    var id: Int
    var image: String
    var nombre: String
}

struct ImagenTab: Identifiable{
    var id: Int
    var eye: String
    var image: String
    var nombre: String
    var descripcion: String
    var image2: String
    var nombre2: String
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
