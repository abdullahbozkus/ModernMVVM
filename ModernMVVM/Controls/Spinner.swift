//
//  Spinner.swift
//  ModernMVVM
//
//  Created by Abdullah Bozkus on 5/22/22.
//  Copyright © 2022 Abdullah Bozkus. All rights reserved.
//

import SwiftUI
import UIKit

struct Spinner: UIViewRepresentable {
    let isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        return spinner
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
