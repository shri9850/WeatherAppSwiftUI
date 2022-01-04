//
//  ContentView.swift
//  WeatherAppNew
//
//  Created by shree on 04/01/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherModel: WeatherViewModel
    init() {
        self.weatherModel = WeatherViewModel()
    }
    var body: some View {
        VStack{
            TextField("Enter City Name", text: self.$weatherModel.cityName, onCommit: {
                self.weatherModel.search()
            }).padding(.all)
            .fixedSize()
            .background(Color.gray)
            
            Text(self.weatherModel.temprature)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
