//
//  ContentView.swift
//  Wypok
//
//  Created by Robert Pelka on 02/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.hits) { hit in
                HStack {
                    Text(String(hit.vote_count))
                        .fontWeight(.medium)
                        .frame(width: 60)
                        .foregroundColor(.green)
                    if let imgURL = hit.preview {
                        Image(systemName: "photo")
                            .data(url: URL(string: imgURL)!)
                            .scaledToFit()
                            .frame(width: 80)
                    }
                    else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                    }
                    Text(hit.title)
                }
            }
            .navigationBarTitle("Wypok")
        }
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Image {
    func data(url:URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
