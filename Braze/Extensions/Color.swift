//
//  Color.swift
//  Braze
//
//  Created by Roy Aiyetin on 01/10/2022.
//

import SwiftUI


let Pink = Color(red: 246/255, green: 127/255, blue: 195/255)
let Purple = Color(red: 182/255, green: 33/255, blue: 254/255)

extension Color {
    ///A custom theme that allows you add color palettes to your app
    static let theme = ColorTheme()
}

//MARK: - ColorTheme
struct ColorTheme {
    let accentColor = Color("AccentColor")
    let background = Color("BackgroundColor")
    let homeBackground = Color("HomeBackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondary = Color("SecondaryTextColor")
    let purple = Color("PurpleColor")
    let blue = Color("BlueColor")
    let increaseRate = Color("CoinIncreaseRateColor")
    let decreaseRate = Color("CoinDecreaseRateColor")
    let portfolio = Color("PortfolioColor")
    let blackWhite = Color("BlackWhite")
    let shadow = Color("Shadow")
    let animationColorBackground = Color("AnimationColorBackground")
}
