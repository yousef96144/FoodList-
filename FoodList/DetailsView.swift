//
//  DetailsView.swift
//   UX Design
//
//  Created by Zlious on 01/05/2025.
//

import SwiftUI

struct DetailsView: View {
    var trail: trail
   
    var body: some View {
        VStack {
            ZStack {
                Image("\(String(describing: trail.image))")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 600)
                    .overlay {
                        LinearGradient(colors:[.black,.red], startPoint: .topLeading, endPoint: .bottomTrailing
                            
                        ).opacity(0.6)
                    }
                
                VStack{
                    VStack(alignment: .trailing) {
                        Text("Booking")
                            .foregroundColor(.white)
                            .padding(9)
                            .background(.orange)
                            .cornerRadius(20)
                            .padding(.bottom , 50)
                    }.frame(maxWidth: 360,alignment: .bottomTrailing)
                        HStack {
                            Label(String(format: "%.1f", trail.rated), systemImage: "star.fill")
                                .font(.caption).bold().padding(3).background(.white).cornerRadius(5)
                            Text(String(format: "%.1f", trail.distance) + "km")
                                .font(.caption).bold().padding(3).background(.white).cornerRadius(5)
                        }.frame(maxWidth: 360,alignment: .topLeading)
                        
                    Text(trail.name).font(.title2).fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity,alignment:.topLeading)
                    Text(trail.location).foregroundColor(.white).frame(maxWidth: .infinity,alignment:.topLeading)
                        
                        HStack {
                            Text("Wi-Fi").font(.caption).bold().padding(3).background(.white).cornerRadius(5)
                            Text("PARKING")
                                .font(.caption).bold().padding(3).background(.white).cornerRadius(5)
                            Text("BAR")
                                .font(.caption).bold().padding(3).background(.white).cornerRadius(5)
                            Spacer()
                            Image(systemName: "heart.fill")  .imageScale(.large)
                                .foregroundColor(.gray).padding(5).background(.white).cornerRadius(.infinity)

                        }
                    }.frame(maxWidth: 360 , alignment: .topTrailing)
               
            }
            Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.").frame(maxWidth: .infinity,alignment: .leading).padding(.leading)
            
            HStack {
                Image(systemName: "calendar.circle").font(.system(size: 40
                    )).foregroundColor(.gray)
                VStack(alignment: .leading) {
                    Text("07:00 - 22:00").fontWeight(.bold)
                    Text("Monday to Sunday  ")
                }
                Spacer()
                Image(systemName: "mappin.circle").font(.system(size: 40
                    )).foregroundColor(.gray)
                Image(systemName: "phone.circle").font(.system(size: 40
                    )).foregroundColor(.gray)
                
            }.padding()
            VStack {
                HStack {
                    Text("Menu").fontWeight(.bold)
                    Spacer()
                    Text(">")
                }.padding().background(Color.gray.opacity(0.2)).cornerRadius(10)
                HStack {
                    Text("Reviews").fontWeight(.bold)
                    Spacer()
                    Text("12")
                    Text(">")
                }.padding().background(Color.gray.opacity(0.2)).cornerRadius(10)
                HStack {
                    Text("Gallery").fontWeight(.bold)
                    Spacer()
                    Text("81")
                    Text(">")
                }.padding().background(Color.gray.opacity(0.2)).cornerRadius(10)
            }.padding()
            
            Spacer()
            
        }.edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    DetailsView( trail: trail(name: "Stanford Dish", image: "listImage1", location: "Palto ALto", rated: 3.4, distance: 4.2))
}
