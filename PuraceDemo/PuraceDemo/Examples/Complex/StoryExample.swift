//
//  StoryExample.swift
//  PuraceDemo
//
//  Created by Juan Hurtado on 15/05/22.
//

import Foundation
import SwiftUI
import Purace

struct StoryExample: View {
    var body: some View {
        Text("`PuraceStoryView(stories: [...])`")
            .padding()
        PuraceStoryView(stories: [
            MockStory(
                image: URL(string: "https://elturismoencolombia.com/wp-content/uploads/2018/06/popayan_iglesia_santo_domingo_colombia_travel.jpg"),
                title: "First title",
                subtitle: "La Universidad del Cauca es una universidad pública de Colombia, sujeta a inspección y vigilancia por medio de la Ley 1740 de 2014 y la ley 30 de 1992 del Ministerio de Educación de Colombia. Su campus principal se encuentra ubicado en la ciudad de Popayán, "
            ),
            MockStory(
                image: URL(string: "https://media-cdn.tripadvisor.com/media/photo-m/1280/14/3f/03/e8/vista-diurna-de-la-ermita.jpg"),
                title: "Second title",
                subtitle: "skdjh asDSd Cauca es una universidad pública de Colombia, sujeta a inspección y vigsdljlkjljsd"
            ),
            MockStory(
                image: URL(string: "https://www.cronicadelquindio.com/files/noticias/20100220064229.jpg"),
                title: "Third title",
                subtitle: "La Ajliyh dlkjsouoy ojsf del Cauca es una universidad pública de Colombia, sujeta a inspección y vigilancia por medio de la Ley 174Sholj ljlih osdfyán, "
            )
        ])
        Spacer()
    }
}

struct MockStory: PuraceStoryData {
    var image: URL?
    var title: String
    var subtitle: String
}
