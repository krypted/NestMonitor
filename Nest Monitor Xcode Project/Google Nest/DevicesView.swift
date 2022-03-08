//
//  DevicesView.swift
//  Google Nest
//
//

import SwiftUI

struct DevicesView: View {
    
    @ObservedObject var vm = DeviceViewModel()
    
    var body: some View {
        List(vm.nest?.devices ?? [Device](), id: \.name) { item in
            HStack {
                VStack {
                    let status = item.traits?.sdmdevicestraitsConnectivity?.status
                    switch status?.lowercased() {
                    case "online":
                        Image(systemName: "arrow.up")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.green)
                    case "offline":
                        Image(systemName: "arrow.down")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.red)
                    case .none:
                        EmptyView()
                    case .some(_):
                        EmptyView()
                    }
                }.frame(width: 50, height: 50)
                Text(item.parentRelations?.first?.displayName ?? "Not Available")
                    .font(.headline)
                    .padding()
                
            }
        }
        .onAppear {
            vm.getDevices()
        }
    }
}

struct DevicesView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesView()
    }
}
