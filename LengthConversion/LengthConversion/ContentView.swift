//
//  ContentView.swift
//  LengthConversion
//
//  Created by Claire on 28/02/2020.
//  Copyright © 2020 Claire Sivadier. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amountToConvert = ""
    @State private var inputUnit = 2
    @State private var outputUnit = 2
    
    let units = ["m", "kM", "ft", "yd", "mi"]
    
    var numberToConvert: Measurement<UnitLength> {
        let inputUnitSelected = String(units[inputUnit])
        let orderAmount = Double(amountToConvert) ?? 0
        var numberToConvert = Measurement(value: orderAmount, unit: UnitLength.meters)
       
        
        switch inputUnitSelected {
        case "m":
            numberToConvert = Measurement(value: orderAmount, unit: UnitLength.meters)
        case "kM":
            numberToConvert = Measurement(value: orderAmount, unit: UnitLength.kilometers)
        case "ft":
            numberToConvert = Measurement(value: orderAmount, unit: UnitLength.feet)
        case "yd":
            numberToConvert = Measurement(value: orderAmount, unit: UnitLength.yards)
        case "mi":
            numberToConvert = Measurement(value: orderAmount, unit: UnitLength.miles)
        default:
            numberToConvert = Measurement(value: orderAmount, unit: UnitLength.meters)
        }
        return numberToConvert
    }
    
    var convert: Measurement<UnitLength> {
        let outputUnitSelected = String(units[outputUnit])
        var convert = numberToConvert.converted(to: UnitLength.meters)
        
        switch outputUnitSelected {
        case "m":
            convert = numberToConvert.converted(to: UnitLength.meters)
        case "kM":
            convert = numberToConvert.converted(to: UnitLength.kilometers)
        case "ft":
            convert = numberToConvert.converted(to: UnitLength.feet)
        case "yd":
            convert = numberToConvert.converted(to: UnitLength.yards)
        case "mi":
            convert = numberToConvert.converted(to: UnitLength.miles)
        default:
            convert = numberToConvert.converted(to: UnitLength.meters)
              }
        return convert
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $amountToConvert)
                        .keyboardType(.decimalPad)
                    
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(0..<units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("\(convert.value)")
                    Picker("Unit", selection: $outputUnit) {
                        ForEach(0..<units.count) {                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
             .navigationBarTitle("Lenght Conversion")
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
}
