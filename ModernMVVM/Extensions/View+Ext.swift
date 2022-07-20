//
//  View+Ext.swift
//  ModernMVVM
//
//  Created by Abdullah Bozkus on 5/23/22.
//  Copyright © 2022 Abdullah Bozkus. All rights reserved.
//

import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView { AnyView(self) }
}
