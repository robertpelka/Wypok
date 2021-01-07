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
        let webView = WebView(urlString: urlString)
        webView
            .navigationBarTitle(URL(string: urlString)?.host ?? "Source", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            webView.goBack()
                        } label: {
                            Image(systemName: "chevron.backward")
                                .padding()
                        }
                        Button {
                            webView.goForward()
                        } label: {
                            Image(systemName: "chevron.forward")
                                .padding()
                        }
                    }
                }
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(urlString: "https://www.google.com")
    }
}
