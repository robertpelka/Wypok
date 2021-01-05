//
//  DetailView.swift
//  Wypok
//
//  Created by Robert Pelka on 05/01/2021.
//

import SwiftUI

struct DetailView: View {
    
    let url: String
    
    var body: some View {
        WebView(urlString: url)
            .navigationBarTitle("Source")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
