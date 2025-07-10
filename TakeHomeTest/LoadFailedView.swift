//
//  LoadFailedView.swift
//  TakeHomeTest
//
//  Created by Eric on 10/07/2025.
//

import SwiftUI

struct LoadFailedView: View {
    var error: (any Error)?
    var retry: () async -> Void

    var body: some View {
        ContentUnavailableView {
            Text("Load error")
                .font(.headline)
        } description: {
            Text("There was an error loading the articles.")
        } actions: {
            Button("Retry") {
                Task { await retry() }
            }
        }
    }
}

#Preview {
    LoadFailedView(error: NSError(domain: "TakeHomeTest", code: 1)) {
        // do nothing
    }
}
