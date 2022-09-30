//
//  Extension.swift
//  Braze
//
//  Created by Roy Aiyetin on 26/09/2022.
//

import SwiftUI

extension Color {
    ///A custom theme that allows you add color palettes to your app
    static let theme = ColorTheme()
}

extension View {
    ///A custom function that draws corner radius in any rectangle corner you so desire
    ///- Parameters
    ///     - radius
    ///     - corners
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    //MARK: - isSmallHeight
    ///Checks the screen size of the phone running the app. Used together with other properties, modifiers and types to modify the screen content to adjust itself depending on the height.
    func isSmallHeight() -> Bool {
        return UIScreen.main.bounds.height < 830
    }
}

//MARK: - ColorTheme
struct ColorTheme {
    let accentColor = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondary = Color("SecondaryTextColor")
    let purple = Color("PurpleColor")
    let blue = Color("BlueColor")
}

//MARK: - RoundedCorner
struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}
