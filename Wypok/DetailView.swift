//
//  DetailView.swift
//  Wypok
//
//  Created by Robert Pelka on 05/01/2021.
//

import SwiftUI

struct DetailView: View {
    
    let urlString: String
    
    var body: some View {
        WebView(urlString: urlString)
            .navigationBarTitle(URL(string: urlString)?.host ?? "Source", displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(urlString: "https://www.google.com")
    }
}
