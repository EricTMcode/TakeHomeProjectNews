//
//  LoadFailedView.swift
//  TakeHomeTest
//
//  Created by Eric on 28/01/2026.
//

import SwiftUI

struct LoadFailedView: View {
    var error: (any Error)?
    var retry: () async -> Void

    var body: some View {
        ContentUnavailableView {
            Text("Load Error")
                .font(.headline)
        } description: {
            Text("There was an error loading the articles. Please try again later.")
        } actions: {
            Button("Retry") {
                Task {
                    await retry()
                }
            }
        }
    }
}

#Preview {
    LoadFailedView(error: NSError(domain: "TakeHomeTest", code: 1, userInfo: nil)) {
        // do nothing
    }
}
