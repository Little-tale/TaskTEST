//
//  ContentView.swift
//  TaskTEST
//
//  Created by Jae hyung Kim on 11/14/24.
//

import SwiftUI

struct ContentView: View, ThreadCheckable {
    @StateObject var viewModel = TestViewModel()
    
    var body: some View {
        VStack {
            Button("시 작") {

                viewModel.body(.increment)
            }
            Button("결과 \(String(viewModel.state.a))") {
                viewModel.body(.clear)
            }
        }
        .onAppear {
            viewModel.body(.onApear)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
