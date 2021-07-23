//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Alvaro Valdes Salazar on 22-07-21.
//

import SwiftUI

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @EnvironmentObject var favorites: Favorites
    @State private var selectedFacility: Facility?

    let resort: Resort
    


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
//MARK: - CHALLENGE 1 - Day 99, Add credits. Done by adding a zstack and text
                ZStack(alignment: .bottomTrailing) {
                    Image(decorative: resort.id)
                        .resizable()
                        .scaledToFit()
                    Text("Credit: \(resort.imageCredit)")
                        .foregroundColor(Color.white)
                        .padding(1)
                        .font(.caption)
                        .background(Color.black)
                        .opacity(0.7)
                        .cornerRadius(3)
                        .padding([.bottom, .trailing], 2)
                }

                Group {
                    HStack {
                        if sizeClass == .compact {
                            Spacer()
                            VStack { ResortDetailsView(resort: resort) }
                            VStack { SkiDetailsView(resort: resort) }
                            Spacer()
                        } else {
                            ResortDetailsView(resort: resort)
                            Spacer().frame(height: 0)
                            SkiDetailsView(resort: resort)
                        }
                        
                    }
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)
                    
                    Text(resort.description)
                        .padding(.vertical)
                    

                    Text("Facilities")
                        .font(.headline)

//                    Text(resort.facilities.joined(separator: ", "))
//                    Text(ListFormatter.localizedString(byJoining: resort.facilities))
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            facility.icon
                                .font(.title)
                                .onTapGesture {
                                    self.selectedFacility = facility
                                }
                        }
                    }
                        .padding(.vertical)
                    
                    
                }
                .padding(.horizontal)
                
                Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
                    if self.favorites.contains(self.resort) {
                        self.favorites.remove(self.resort)
                    } else {
                        self.favorites.add(self.resort)
                    }
                }
                .padding()

            }
        }
        .navigationBarTitle(Text("\(resort.name), \(resort.country)"), displayMode: .inline)

        .alert(item: $selectedFacility) { facility in
            facility.alert
        }
        
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: Resort.example)
    }
}
