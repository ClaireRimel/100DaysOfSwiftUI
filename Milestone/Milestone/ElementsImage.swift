//
//  ElementsImage.swift
//  Milestone
//
//  Created by Claire on 17/04/2020.
//  Copyright © 2020 Claire Sivadier. All rights reserved.
//

import SwiftUI

struct ElementsImage: View {
    
    var image: String
    
    var body: some View {
        
        Image(image)
            .renderingMode(.original)
            .resizable()
            .frame(width: 100)
            .aspectRatio(contentMode: .fit)
    }
}
