//
//  RotatedBadgeSymbol.swift
//  TurkiyeTravel
//
//  Created by Gökhan Tuncay on 19.12.2024.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
