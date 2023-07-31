//
//  ContentView.swift
//  test_1
//
//  Created by سكينه النجار on 30/07/2023.
//

import SwiftUI

struct CardData: Identifiable {
    let id: UUID = UUID()
    let title: String
    let subtitle: String
    let price: Int
    let asyncImage : String
}

//URL(string: "https://source.unsplash.com/200x200/?[subject]")

struct CardView: View {
    
    let data: CardData
    
    var body: some View {
        GeometryReader {GeometryProxy in
            ZStack {
                AsyncImage(url: URL(string: data.asyncImage)) { result in
                    if let image = result.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                    } else {
                        Rectangle()
                            .fill(Color.black.opacity(0.1))
                    }
                }
                //https://source.unsplash.com/200x200/?[subject]//
                .frame( width:GeometryProxy.size.width,
                        height: GeometryProxy.size.height)
            }
            VStack {
                Spacer()
                Text(data.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(data.subtitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundColor(.white)
            .background(Gradient(colors: [.clear, .clear, .black]))
            .frame(height: 200)
        }
    }
}
struct ContentView: View {
    let categories: Array<String> = [
        "Discover",
        "⚽️Sports",
        "🎷Music",
        "🎭Shows"
    ]
    
    let cards: Array<CardData> = Array(
        repeating: CardData(
            title: "Title",
            subtitle: "Description",
            price: 10,
            asyncImage: "https://source.unsplash.com/200x200/?[sport]"
        ),
        count: 10
    )
    
    var body: some View {
        NavigationView {
            VStack {
                // MARK: Title
                Text("Riyadh City")
                    .font(.system(.largeTitle))
                // MARK: Search Box
                HStack {
                    Image(systemName: "swift")
                    TextField("Search", text: .constant(""))
                }
                // MARK: Categories
                ScrollView(.horizontal){
                    HStack(spacing: 10) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 50)
                                    .stroke(.black, lineWidth:3))
                                .background(.gray)
                                .cornerRadius(50)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }

                // Headline Card
                ZStack {
                    AsyncImage(url: URL(string: "https://source.unsplash.com/200x200/?[sport]")){ result in
                        if let image = result.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .cornerRadius(10)
                                .clipped()
                        } else {
                            Rectangle()
                                .fill(Color.black.opacity(0.1))
                        }
                    }
                    VStack {
                        Spacer()
                        Text("NO Pelicans @ BRK Nets")
                        Text("Wed 10/19 • 7:30 PM • $33")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.white)
                }
                .padding()
                .frame(height: 200)
                // MARK: Popular Cards
                HStack {
                    Text("Popular")
                    Spacer()
                    
                    NavigationLink {
                        DetailsView()
                    } label: {
                        Text("See All >")
                    }
                }
                .padding(.horizontal)
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(cards) { card in
                            ZStack {
                                AsyncImage(url: URL(string: card.asyncImage)){ result in
                                    if let image = result.image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(height: 150)
                                            .clipped()
                                            .cornerRadius(10)
                                    } else {
                                        Rectangle()
                                            .fill(Color.black.opacity(0.1))
                                    }
                                }
                                
                                VStack {
                                    Spacer()
                                    Text(card.title)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    HStack {
                                        Text(card.subtitle)
                                        Spacer()
                                        Text(card.price.description)
                                    }
                                }
                                .padding()
                            }
                            .foregroundColor(.white)
                            .frame(width: 300, height: 150)
                        }
                    }
                }
                .padding()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
            
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //CardView(data: CardData(title: "sksk", subtitle: "fatm", price: 10, asyncImage: "https://source.unsplash.com/200x200/?[sport]"))
        ContentView()
    }
}
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            /*
             
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
             */
            
            
            
