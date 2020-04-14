//
//  FlagImage.swift
//  GuesstheFlag
//
//  Created by Claire on 14/04/2020.
//  Copyright © 2020 Claire Sivadier. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    
    var image: String

    var body: some View {
        
        Image(image)
                                 .renderingMode(.original)
                                 .clipShape(RoundedRectangle(cornerRadius: 8))
                                 .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                                 .shadow(color: .black, radius: 2)
    }
}
