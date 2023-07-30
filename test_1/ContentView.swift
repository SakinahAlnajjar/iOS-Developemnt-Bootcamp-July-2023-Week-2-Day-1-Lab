//
//  ContentView.swift
//  test_1
//
//  Created by سكينه النجار on 30/07/2023.
//

import SwiftUI

struct ContentView: View {
    let categories = ["Disc","sport","music","shows"]
    var title = "No Pelicans @ BRK Nets"
    var Subtitle = "Wed 10/19 , 7:30 PM"
    var price = 33
    
    
    var body: some View {
        VStack {
            Text("Riyad city")
                .bold()
                .font(.largeTitle)
            HStack{
                Image(systemName: "swift")
                TextField("search", text: .constant (""))
                    .frame(maxWidth: .infinity , alignment: .leading)
            }
            .padding()
            
            HStack {
                ForEach(categories, id: \.self) { item in
                    Text(item)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
            
            ZStack(alignment: .bottomLeading){
                Rectangle()
                    .fill(.gray)
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                VStack(alignment: .leading){
                    Text("\(title)")
                    Text("\(Subtitle).\(price)$")
                }
                .padding()
            }
            
            HStack{
                Text("Popular")
                Spacer()
                Button {
                    print("button clicked")
                } label: {
                    Text("see All>")
                }
            }
            
            ScrollView(.horizontal){
                HStack(spacing: 10){
                    ForEach(0..<11) { index in
                        ZStack(alignment: .bottomLeading){
                            Rectangle()
                                .fill(.gray)
                                .frame(width:200 ,height: 100)
                                .frame(maxWidth: .infinity)
                            VStack(alignment: .leading){
                                Text("title")
                                Text("description")
                                
                            }
                        }
                    }
                }
            }
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
