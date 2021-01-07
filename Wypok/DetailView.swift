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
                        Button {
                            actionSheet()
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .padding()
                        }
                        Button {
                            webView.reload()
                        } label: {
                            Image(systemName: "arrow.clockwise")
                                .padding()
                        }
                    }
                }
            }
    }
    
    func actionSheet() {
        guard let data = URL(string: urlString) else { return }
        let activityView = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityView, animated: true, completion: nil)
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(urlString: "https://www.google.com")
    }
}
