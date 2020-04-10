//
//  BasicScroll.swift
//  OpenTab
//
//  Created by Richard de Borja on 2019-10-18.
//  Copyright © 2019 Richard de Borja. All rights reserved.
//

import SwiftUI

struct Box: Identifiable {
    var id = UUID()
    var image: String
}

struct BasicScroll: View {
    var boxes: [Box] = [Box(image: "Rum"), Box(image: "Gin"), Box(image: "Tequila"), Box(image: "Whiskey"), Box(image: "Vodka")]
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    ForEach(boxes) { box in
                        Image(box.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    }
                }
            }
        }
    }
}

struct BasicScroll_Previews: PreviewProvider {
    static var previews: some View {
        BasicScroll()
    }
}
