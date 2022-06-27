////
////  ContentView.swift
////  SwiftUI_Example
////
////  Created by 맥북 on 2022/06/16.
////
//
//import SwiftUI
//
//struct FullScreenModalView: View {
//  @Environment(\.presentationMode)
//  var presentationMode
//
//  var body: some View {
//    ZStack {
//      Color.white.edgesIgnoringSafeArea(.all)
//      Button("Dismiss Modal") {
//        presentationMode.wrappedValue.dismiss()
//      }
//    }
//  }
//}
//
//struct RemoveView: View {
//  var body: some View {
//    Color.black.opacity(0.001).edgesIgnoringSafeArea(.all)
//  }
//}
//
//struct ModalView: View {
//  var body: some View {
//    VStack {
//      Spacer()
//      FullScreenModalView()
//        .frame(width: 400, height: 250)
//    }
//  }
//}
//
//struct ContentView: View {
//  @State private var isPresented = false
//  let modal = ModalView()
//
//
//  var body: some View {
//    VStack {
//      Spacer()
//      Text("Hello")
//      Spacer()
//      Button("Present!") {
//        isPresented.toggle()
//      }
//      .fullScreenCover(isPresented: $isPresented) {
//        ModalDimView(modal: modal, isSelected: $isPresented)
//      }
//      Spacer()
//    }
//  }
//}
//
//struct ModalDimView<T>: View where T: View {
//  let removeView = RemoveView()
//  let modal: T
//  var isSelected: Binding<Bool>
//
//  init(modal: T, isSelected: Binding<Bool>) {
//    self.modal = modal
//    self.isSelected = isSelected
//  }
//
//  var body: some View {
//    ZStack {
//      removeView
//        .onTapGesture {
//          isSelected.wrappedValue.toggle()
//        }
//      modal
//        .clearModalBackground()
//    }
//  }
//}
//
//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    ContentView()
//  }
//}






////
////  ContentView.swift
////  SwiftUI_Example
////
////  Created by 맥북 on 2022/06/16.
////
//
//import SwiftUI
//
//struct FullScreenModalView: View {
//  @Environment(\.presentationMode)
//  var presentationMode
//
//  var body: some View {
//    ZStack {
//      Color.white.edgesIgnoringSafeArea(.all)
//      Button("Dismiss Modal") {
//        presentationMode.wrappedValue.dismiss()
//      }
//    }
//  }
//}
//
//struct RemoveView: View {
//  @Environment(\.presentationMode)
//  var presentationMode
//
//  var body: some View {
//    Color.black.opacity(0.001).edgesIgnoringSafeArea(.all)
//  }
//}
//
//struct ContentView: View {
//  @State private var isPresented = false
//  let modal = FullScreenModalView()
//  let removeView = RemoveView()
//
//  var body: some View {
//    VStack {
//      Spacer()
//      Text("Hello")
//      Spacer()
//      Button("Present!") {
//        isPresented.toggle()
//      }
//      .fullScreenCover(isPresented: $isPresented) {
//        ZStack {
//          removeView
//            .onTapGesture {
//              isPresented.toggle()
//            }
//          VStack {
//            Spacer()
//            modal
//              .frame(width: 400, height: 250)
//              .clearModalBackground()
//          }
//        }
//      }
//      Spacer()
//    }
//  }
//}
//
//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    ContentView()
//  }
//}
