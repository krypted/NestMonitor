//
//  DeviceViewModel.swift
//  Google Nest
//
//

import Foundation

class DeviceViewModel: ObservableObject {
    
    private var service = DeviceService()
    
    @Published var nest: GoogleNest?
    
    var totalDevices: Int {
        nest?.devices?.count ?? 0
    }
    
    init() {}
    
    func device(at index: Int) -> Device {
        nest?.devices?[index] ?? Device()
    }
    
    func getDevices() {
        service.getDevices { devices in
            self.nest = devices
        }
    }
    
    
    
}
