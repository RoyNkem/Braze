//
//  Extension.swift
//  Braze
//
//  Created by Roy Aiyetin on 26/09/2022.
//

import SwiftUI

extension View {
    ///A custom function that draws corner radius in any rectangle corner you so desire
    ///- Parameter radius: the
    /// - corners
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    //MARK: - isSmallHeight
    ///Checks the screen size of the phone running the app. Used together with other properties, modifiers and types to modify the screen content to adjust itself depending on the height.
    func isSmallHeight() -> Bool {
        return UIScreen.main.bounds.height < 830
    }
}
