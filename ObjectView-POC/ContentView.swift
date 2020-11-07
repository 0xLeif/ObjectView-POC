//
//  ContentView.swift
//  ObjectView-POC
//
//  Created by Zach Eriksen on 11/7/20.
//

import SwiftUI
import SUIObject

struct ContentView: View {
    var body: some View {
        Object("Hello, World!") { obj in
            obj.add(variable: "otherText", value: "Another one")
            obj.add(function: "change", value: { _ in
                obj.variables["otherText"] = "\(obj.otherText.stringValue() ?? "")+"
            })
        }.view { obj in
            VStack {
                Text(obj.stringValue() ?? "-1")
                Text(obj.otherText.stringValue() ?? "-2")
                Button("Change") {
                    obj.run(function: "change")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
