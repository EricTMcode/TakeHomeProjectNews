//
//  LoadFailedView.swift
//  TakeHomeTest
//
//  Created by Eric on 28/01/2026.
//

import SwiftUI

struct LoadFailedView: View {
    var error: (any Error)?
    var retry: () -> Void

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    LoadFailedView(error: NSError(domain: "TakeHomeTest", code: 1, userInfo: nil)) {
        // do nothing
    }
}
