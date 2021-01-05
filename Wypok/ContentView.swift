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
                NavigationLink(destination: DetailView(url: hit.source_url)) {
                    HStack(alignment: .top) {
                        VStack {
                            if let imgURL = hit.preview, let url = URL(string: imgURL) {
                                Image(systemName: "photo")
                                    .data(url: url)
                                    .scaledToFit()
                                    .frame(width: 80)
                            }
                            else {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80)
                            }
                            Text(String(hit.vote_count))
                                .fontWeight(.medium)
                                .foregroundColor(.green)
                        }
                        Text(hit.title
                                .replacingOccurrences(of: "&quot;", with: "\"")
                                .replacingOccurrences(of: "&lt;", with: "<")
                                .replacingOccurrences(of: "&gt;", with: ">")
                        )
                    }
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
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
