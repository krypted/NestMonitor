//
//  User.swift
//  Google Nest
//
//

import Foundation
import GoogleSignIn

//class User: GIDGoogleUser, Encodable {
//
//}


struct GoogleNest : Codable {

    let devices : [Device]?


    enum CodingKeys: String, CodingKey {
        case devices = "devices"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        devices = try values.decodeIfPresent([Device].self, forKey: .devices)
    }


}

struct Device : Codable {

    let assignee : String?
    let name : String?
    let parentRelations : [ParentRelation]?
    let traits : Trait?
    let type : String?


    enum CodingKeys: String, CodingKey {
        case assignee = "assignee"
        case name = "name"
        case parentRelations = "parentRelations"
        case traits = "traits"
        case type = "type"
    }
    
    init() {
        assignee = ""
        name = ""
        parentRelations = [ParentRelation]()
        traits = Trait()
        type = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        assignee = try values.decodeIfPresent(String.self, forKey: .assignee)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        parentRelations = try values.decodeIfPresent([ParentRelation].self, forKey: .parentRelations)
        traits = try values.decodeIfPresent(Trait.self, forKey: .traits)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }


}

struct Trait : Codable {

    let sdmdevicestraitsConnectivity : SdmDevicesTraitsConnectivity?
    let sdmdevicestraitsFan : SdmDevicesTraitsFan?
    let sdmdevicestraitsHumidity : SdmDevicesTraitsHumidity?
    let sdmdevicestraitsInfo : SdmDevicesTraitsInfo?
    let sdmdevicestraitsSettings : SdmDevicesTraitsSetting?
    let sdmdevicestraitsTemperature : SdmDevicesTraitsTemperature?
    let sdmdevicestraitsThermostatEco : SdmDevicesTraitsThermostatEco?
    let sdmdevicestraitsThermostatHvac : SdmDevicesTraitsConnectivity?
    let sdmdevicestraitsThermostatMode : SdmDevicesTraitsThermostatMode?
    let sdmdevicestraitsThermostatTemperatureSetpoint : SdmDevicesTraitsFan?


    enum CodingKeys: String, CodingKey {
        case sdmdevicestraitsConnectivity = "sdm.devices.traits.Connectivity"
        case sdmdevicestraitsFan = "sdm.devices.traits.Fan"
        case sdmdevicestraitsHumidity = "sdm.devices.traits.Humidity"
        case sdmdevicestraitsInfo = "sdm.devices.traits.Info"
        case sdmdevicestraitsSettings = "sdm.devices.traits.Settings"
        case sdmdevicestraitsTemperature = "sdm.devices.traits.Temperature"
        case sdmdevicestraitsThermostatEco = "sdm.devices.traits.ThermostatEco"
        case sdmdevicestraitsThermostatHvac = "sdm.devices.traits.ThermostatHvac"
        case sdmdevicestraitsThermostatMode = "sdm.devices.traits.ThermostatMode"
        case sdmdevicestraitsThermostatTemperatureSetpoint = "sdm.devices.traits.ThermostatTemperatureSetpoint"
    }
    
    init() {
        sdmdevicestraitsFan = SdmDevicesTraitsFan()
        sdmdevicestraitsConnectivity = SdmDevicesTraitsConnectivity()
        sdmdevicestraitsHumidity = SdmDevicesTraitsHumidity()
        sdmdevicestraitsInfo = SdmDevicesTraitsInfo()
        sdmdevicestraitsSettings = SdmDevicesTraitsSetting()
        sdmdevicestraitsTemperature = SdmDevicesTraitsTemperature()
        sdmdevicestraitsThermostatEco = SdmDevicesTraitsThermostatEco()
        sdmdevicestraitsThermostatHvac = SdmDevicesTraitsConnectivity()
        sdmdevicestraitsThermostatMode = SdmDevicesTraitsThermostatMode()
        sdmdevicestraitsThermostatTemperatureSetpoint = SdmDevicesTraitsFan()
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sdmdevicestraitsConnectivity = try values.decodeIfPresent(SdmDevicesTraitsConnectivity.self, forKey: .sdmdevicestraitsConnectivity)
        sdmdevicestraitsFan = try values.decodeIfPresent(SdmDevicesTraitsFan.self, forKey: .sdmdevicestraitsFan)
        sdmdevicestraitsHumidity = try values.decodeIfPresent(SdmDevicesTraitsHumidity.self, forKey: .sdmdevicestraitsHumidity)
        sdmdevicestraitsInfo = try values.decodeIfPresent(SdmDevicesTraitsInfo.self, forKey: .sdmdevicestraitsInfo)
        sdmdevicestraitsSettings = try values.decodeIfPresent(SdmDevicesTraitsSetting.self, forKey: .sdmdevicestraitsSettings)
        sdmdevicestraitsTemperature = try values.decodeIfPresent(SdmDevicesTraitsTemperature.self, forKey: .sdmdevicestraitsTemperature)
        sdmdevicestraitsThermostatEco = try values.decodeIfPresent(SdmDevicesTraitsThermostatEco.self, forKey: .sdmdevicestraitsThermostatEco)
        sdmdevicestraitsThermostatHvac = try values.decodeIfPresent(SdmDevicesTraitsConnectivity.self, forKey: .sdmdevicestraitsConnectivity)
        sdmdevicestraitsThermostatMode = try values.decodeIfPresent(SdmDevicesTraitsThermostatMode.self, forKey: .sdmdevicestraitsThermostatMode)
        sdmdevicestraitsThermostatTemperatureSetpoint = try values.decodeIfPresent(SdmDevicesTraitsFan.self, forKey: .sdmdevicestraitsFan)
    }


}

struct SdmDevicesTraitsThermostatMode : Codable {

    let availableModes : [String]?
    let mode : String?


    enum CodingKeys: String, CodingKey {
        case availableModes = "availableModes"
        case mode = "mode"
    }
    
    init() {
        availableModes = []
        mode = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        availableModes = try values.decodeIfPresent([String].self, forKey: .availableModes)
        mode = try values.decodeIfPresent(String.self, forKey: .mode)
    }


}

struct SdmDevicesTraitsThermostatEco : Codable {

    let availableModes : [String]?
    let coolCelsius : Int?
    let heatCelsius : Float?
    let mode : String?


    enum CodingKeys: String, CodingKey {
        case availableModes = "availableModes"
        case coolCelsius = "coolCelsius"
        case heatCelsius = "heatCelsius"
        case mode = "mode"
    }
    
    init() {
        availableModes = []
        coolCelsius = 0
        heatCelsius = 0.0
        mode = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        availableModes = try values.decodeIfPresent([String].self, forKey: .availableModes)
        coolCelsius = try values.decodeIfPresent(Int.self, forKey: .coolCelsius)
        heatCelsius = try values.decodeIfPresent(Float.self, forKey: .heatCelsius)
        mode = try values.decodeIfPresent(String.self, forKey: .mode)
    }


}

struct SdmDevicesTraitsTemperature : Codable {

    let ambientTemperatureCelsius : Float?


    enum CodingKeys: String, CodingKey {
        case ambientTemperatureCelsius = "ambientTemperatureCelsius"
    }
    
    init() {
        ambientTemperatureCelsius = 0.0
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ambientTemperatureCelsius = try values.decodeIfPresent(Float.self, forKey: .ambientTemperatureCelsius)
    }


}

struct SdmDevicesTraitsSetting : Codable {

    let temperatureScale : String?


    enum CodingKeys: String, CodingKey {
        case temperatureScale = "temperatureScale"
    }
    
    init() {
        temperatureScale = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temperatureScale = try values.decodeIfPresent(String.self, forKey: .temperatureScale)
    }


}

struct SdmDevicesTraitsInfo : Codable {

    let customName : String?


    enum CodingKeys: String, CodingKey {
        case customName = "customName"
    }
    
    init() {
        customName = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        customName = try values.decodeIfPresent(String.self, forKey: .customName)
    }


}

struct SdmDevicesTraitsHumidity : Codable {

    let ambientHumidityPercent : Int?


    enum CodingKeys: String, CodingKey {
        case ambientHumidityPercent = "ambientHumidityPercent"
    }
    
    init() {
        ambientHumidityPercent = 0
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ambientHumidityPercent = try values.decodeIfPresent(Int.self, forKey: .ambientHumidityPercent)
    }


}

struct SdmDevicesTraitsFan : Codable {



//    enum CodingKeys: String, CodingKey {
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//    }


}

struct SdmDevicesTraitsConnectivity : Codable {

    let status : String?


    enum CodingKeys: String, CodingKey {
        case status = "status"
    }
    
    init() {
        status = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }


}

struct ParentRelation : Codable {

    let displayName : String?
    let parent : String?


    enum CodingKeys: String, CodingKey {
        case displayName = "displayName"
        case parent = "parent"
    }
    
    init() {
        displayName = ""
        parent = ""
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
        parent = try values.decodeIfPresent(String.self, forKey: .parent)
    }


}
