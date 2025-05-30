//
//  ContentView.swift
//  FoodList
//
//  Created by Zlious on 21/05/2025.
//

import SwiftUI

struct restaurant{
   var uniqueID: Int
   var image:String
   var category:String
   var title: String
   var body: String
}
struct ContentView: View {
    let restaurants = [
        restaurant(uniqueID: 1, image: "restu/rest1", category: "Top",title: "Restaurant1", body: "this is a good restaurant have cafe and wifi"),
        restaurant(uniqueID: 2, image: "restu/rest2", category: "Trending",title: "Restaurant2", body: "this is a good restaurant have cafe and wifi"),
        restaurant(uniqueID: 3, image: "restu/rest3",category: "Nearby" ,title: "Restaurant3", body: "this is a good restaurant have cafe and wifi"),
     
    ]
    let restaurantsList = [
        trail(name: "Stanford Dish", image: "listImage1", location: "Palto ALto", rated: 3.4, distance: 4.2),
        trail(name: "Joesiph Dish", image: "listImage2", location: "Ismailia", rated: 4.5, distance: 30.0),
        trail(name: "Stanford Dish", image: "listImage3", location: "Palto ALto", rated: 2.5, distance: 4.2),
        trail(name: "Stanford Dish", image: "listImage4", location: "Nasser city", rated: 4.0, distance: 4.2),
        trail(name: "Stanford Dish", image: "listImage5", location: "cairo", rated: 3.4, distance: 10.0)
    ]
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Restaurant").font(.largeTitle).bold()
                        Text("New York , USAN").foregroundColor(.gray.opacity(0.9))
                    }
                    Spacer()
                    Image("yousef").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 64,height: 64)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                    
                }.padding()
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        ForEach(restaurants,id: \.uniqueID) { restaurant in
                            ZStack {
                                Image("\(restaurant.image)").resizable().shadow(color: .gray,radius: 20)
                                LinearGradient(colors: [.black,.red], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.5).aspectRatio(contentMode: .fill)
                                VStack {
                                    Text(restaurant.category).foregroundColor(.white).frame(maxWidth: .infinity,alignment:.topLeading).padding()
                                    Text(restaurant.title).font(.title2).fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity,alignment:.topLeading).padding(.leading)
                                    HStack {
                                        Text(restaurant.body).foregroundColor(.white).fixedSize(horizontal: false, vertical: true)
                                        Spacer()
                                        Text("SEE ALL").foregroundColor(.black).padding().fontWeight(.bold).background().cornerRadius(12)
                                    }.padding()
                                }
                                
                            }.frame(width: 300, height: 200).cornerRadius(20.0)
                        }
                    }
                }
                HStack {
                    Text("Top Rated").font(.title3).fontWeight(.bold)
                    Spacer()
                    Text("See All >").font(.system(size: 15)).fontWeight(.bold).foregroundColor(.red)
                }.padding()
                List(restaurantsList) { trail in
                    NavigationLink(destination: DetailsView()) {
                        trailRow(trail: trail)
                    }.listRowSeparator(.hidden)
                    
                }
                
            }
            .padding()
        }
    }
}

struct trail:Identifiable{
    let id = UUID()
    let name: String
    let image: String
    let location: String
    let rated: Double
    let distance: Double
}

struct trailRow: View {
    var trail: trail
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                HStack {
                    Image("\(trail.image)").resizable().background(.black).cornerRadius(7.0).frame(width: 100,height: 100)
                    VStack(alignment: .leading) {
                        Text(trail.name)
                        Text(trail.location).font(.subheadline).foregroundColor(.gray)
                        HStack {
                            Image(systemName: "star.fill")
                                .imageScale(.small)
                                .foregroundColor(.red)
                            Text(String(format: "%.1f", trail.rated)).font( .subheadline)
                        }
                    }
                    
                }
               
            }
            Spacer()
            VStack {
                Image(systemName: "heart.fill")  .imageScale(.small)
                    .foregroundColor(.red).padding()
                
                Text(String(format: "%.1f", trail.distance)).font( .footnote).padding(4).overlay {
                    RoundedRectangle(cornerRadius: 3).stroke(.gray,lineWidth: 1)
                }                    }
        }
    }
}
#Preview {
    ContentView()
}
