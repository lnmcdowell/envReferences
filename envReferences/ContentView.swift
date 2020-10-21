//
//  ContentView.swift
//  envReferences
//
//  Created by Nathaniel Mcdowell on 10/21/20.
//

import SwiftUI

struct ContentView: View {
    //1
    @EnvironmentObject var dsepCopy:testObject
    @State private var isShown:Bool = false
    var body: some View {
        //Text("Hello, world! - from \(myObj.name)")
          //  .padding()
        VStack{
        statusView()
        Button("Launch", action: {
            print("works")
            isShown = true
        }).sheet(isPresented: $isShown, onDismiss: {print("dismissed")}, content: {
            sheetView().environmentObject(dsepCopy) //2
          
        })
        }
    }
}

/*
 Note that 1 and 2 were needed in order to.... allow no crash if typing when closing or playing with partial drag of sheet
 Without this, you get error message that
 Thread 1: Fatal error: No ObservableObject of type testObject found.
 A View.environmentObject(_:) for testObject may be missing
 as an ancestor of this view.
 Works fine if you dismiss it completely with drag or button, but crashes if you "Played" with dismiss drag,
 but didn't complete and attempt to continue typing in the textfield
 */

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(testObject())
    }
}

struct sheetView:View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var localObj:testObject
    //@ObservedObject var localObj:testObject
    var body: some View {
    Text("I'll have a burrito!")
    //Toggle("Move the parent's Bool", isOn: <#T##Binding<Bool>#>)
    TextField("my name is:", text: $localObj.name)
    Button("Dismiss Me!!!",action: {
        self.presentationMode.wrappedValue.dismiss()
    })
    }
}

struct statusView:View {
    @EnvironmentObject var statObj:testObject
    var body: some View{
        Text("Hey yall from \(statObj.name)")
            .padding()
            .border(Color.red, width: 3)
    }
}
