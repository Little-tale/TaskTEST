//
//  TestViewModel.swift
//  TaskTEST
//
//  Created by Jae hyung Kim on 11/14/24.
//

import Foundation

final class TestViewModel: ObservableObject, ThreadCheckable {
    @Published private(set) var state = State()
    
    struct State {
        var a = 0
    }
    
    enum Action {
        case onApear
        case increment
        case clear
    }
    
    func body(_ action: Action) {
        switch action {
        case .onApear:
            body(.clear)
            
        case .increment:
            for i in 0..<10 {
//                Task {
//                    Task(priority: .low) {
//                        let random = Double.random(in: 0..<2)
//                        try await Task.sleep(for: .seconds(random))
//                        
//                        await MainActor.run {
//                            state.a -= i
//                            print("==>?")
//                            checkedMainThread()
//                        }
//                        print(Task.currentPriority)
//                    }
//                    Task(priority: .medium) {
//                        let random = Double.random(in: 0..<2)
//                        try await Task.sleep(for: .seconds(random))
//                        
//                        await MainActor.run {
//                            state.a += i
//                            print("==>?")
//                            //                        checkedMainThread()
//                        }
//                        print("current a: \(state.a)")
//                        print(Task.currentPriority)
//                    }
//                    Task(priority: .high) {
//                        let random = Double.random(in: 0..<2)
//                        try await Task.sleep(for: .seconds(random))
//                        
//                        await MainActor.run {
//                            state.a -= i
//                            print("==>?")
//                            //                        checkedMainThread()
//                        }
//                        print("current a: \(state.a)")
//                        print(Task.currentPriority)
//                    }
//                    
//                    Task(priority: .userInitiated) {
//                        let random = Double.random(in: 0..<2)
//                        try await Task.sleep(for: .seconds(random))
//                        
//                        await MainActor.run {
//                            state.a += i
//                            print("==>?")
//                            //                        checkedMainThread()
//                        }
//                        print("current a: \(state.a)")
//                        print(Task.currentPriority)
//                        checkedMainThread()
//                    }
//                    print("나 부모 : ", Task.currentPriority)
//                }
                Task {
                    Task(priority: .low) {
                        Task {
                            Task(priority: .high) {
                                let random = Double.random(in: 0..<2)
                                try await Task.sleep(for: .seconds(random))
                                
                                await MainActor.run {
                                    state.a -= i
                                    print("==>?")
                                    checkedMainThread()
                                }
                                print(Task.currentPriority)
                                print("나 부모2의 Low : ", Task.currentPriority)
                            }
                            //                    Task(priority: .medium) {
                            //                        let random = Double.random(in: 0..<2)
                            //                        try await Task.sleep(for: .seconds(random))
                            //
                            //                        await MainActor.run {
                            //                            state.a += i
                            //                            print("==>?")
                            //                            //                        checkedMainThread()
                            //                        }
                            //                        print("current a: \(state.a)")
                            //                        print("나 부모2의 medium : ", Task.currentPriority)
                            //
                            //                    }
                            //                    Task(priority: .userInitiated) {
                            //                        let random = Double.random(in: 0..<2)
                            //                        try await Task.sleep(for: .seconds(random))
                            //
                            //                        await MainActor.run {
                            //                            state.a -= i
                            //                            print("==>?")
                            //                            //                        checkedMainThread()
                            //                        }
                            //                        print("current a: \(state.a)")
                            //                        print("나 부모2의 userInitiated : ", Task.currentPriority)
                            //                    }
                            //
                            //                    Task(priority: .high) {
                            //                        let random = Double.random(in: 0..<2)
                            //                        try await Task.sleep(for: .seconds(random))
                            //
                            //                        await MainActor.run {
                            //                            state.a += i
                            //                            print("==>?")
                            //                            //                        checkedMainThread()
                            //                        }
                            //                        print("current a: \(state.a)")
                            //                        print(Task.currentPriority)
                            //                        checkedMainThread()
                            //                        print("나 부모2의 high : ", Task.currentPriority)
                            //                    }
                            print("나 부모2 : ", Task.currentPriority)
                        }
                        print("나 부모2 의 부모 : ", Task.currentPriority)
                    }
                    print("나 부모2 의 부모의 부모 : ", Task.currentPriority)
                }
            }
        case .clear:
            state.a = 0
        }
    }
}
