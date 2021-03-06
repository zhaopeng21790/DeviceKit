//
//  Tests.swift
//  DeviceKit
//
//  Created by Dennis Weissmann on 11/16/14.
//  Copyright (c) 2015 Hot Action Studios. All rights reserved.
//

@testable import DeviceKit
import XCTest

class DeviceKitTests: XCTestCase {

  var device: Device!

  override func setUp() {
    super.setUp()
    device = Device()
  }

  func testDeviceSimulator() {
    XCTAssertTrue(device.isOneOf(Device.allSimulators))
  }

  func testDeviceDescription() {
    XCTAssertTrue(device.description.hasPrefix("Simulator"))
    XCTAssertTrue(device.description.contains("iPhone") || device.description.contains("iPad") || device.description.contains("iPod") || device.description.contains("TV"))
  }

  // MARK: - iOS
  #if os(iOS)
  func testIsSimulator() {
    XCTAssertTrue(device.isSimulator)
  }

  func testBattery() {
    XCTAssertTrue(Device.BatteryState.full > Device.BatteryState.charging(100))
    XCTAssertTrue(Device.BatteryState.charging(75) != Device.BatteryState.unplugged(75))
    XCTAssertTrue(Device.BatteryState.unplugged(2) > Device.BatteryState.charging(1))
  }

  func testMapFromIdentifier() {
    XCTAssertEqual(Device.mapToDevice(identifier: "iPod5,1"), .iPodTouch5)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPod7,1"), .iPodTouch6)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone3,1"), .iPhone4)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone3,2"), .iPhone4)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone3,3"), .iPhone4)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone4,1"), .iPhone4s)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone5,1"), .iPhone5)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone5,2"), .iPhone5)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone5,3"), .iPhone5c)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone5,4"), .iPhone5c)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone6,1"), .iPhone5s)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone6,2"), .iPhone5s)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone7,2"), .iPhone6)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone7,1"), .iPhone6Plus)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone8,1"), .iPhone6s)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone8,2"), .iPhone6sPlus)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone9,1"), .iPhone7)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone9,3"), .iPhone7)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone9,2"), .iPhone7Plus)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone9,4"), .iPhone7Plus)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPhone8,4"), .iPhoneSE)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad2,1"), .iPad2)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad2,2"), .iPad2)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad2,3"), .iPad2)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad2,4"), .iPad2)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad3,1"), .iPad3)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad3,2"), .iPad3)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad3,3"), .iPad3)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad3,4"), .iPad4)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad3,5"), .iPad4)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad3,6"), .iPad4)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad4,1"), .iPadAir)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad4,2"), .iPadAir)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad4,3"), .iPadAir)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad5,3"), .iPadAir2)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad5,4"), .iPadAir2)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad6,11"), .iPad5)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad6,12"), .iPad5)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad2,5"), .iPadMini)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad2,6"), .iPadMini)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad2,7"), .iPadMini)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad4,4"), .iPadMini2)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad4,5"), .iPadMini2)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad4,6"), .iPadMini2)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad4,7"), .iPadMini3)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad4,8"), .iPadMini3)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad4,9"), .iPadMini3)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad5,1"), .iPadMini4)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad5,2"), .iPadMini4)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad6,3"), .iPadPro9Inch)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad6,4"), .iPadPro9Inch)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad6,7"), .iPadPro12Inch)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad6,8"), .iPadPro12Inch)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad7,1"), .iPadPro12Inch2)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad7,2"), .iPadPro12Inch2)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad7,3"), .iPadPro10Inch)
    XCTAssertEqual(Device.mapToDevice(identifier: "iPad7,4"), .iPadPro10Inch)
  }

  func testScreenRatio() {
    XCTAssertTrue(Device.iPodTouch5.screenRatio == (width: 9, height: 16))
    XCTAssertTrue(Device.iPodTouch6.screenRatio == (width: 9, height: 16))
    XCTAssertTrue(Device.iPhone4.screenRatio == (width: 2, height: 3))
    XCTAssertTrue(Device.iPhone4s.screenRatio == (width: 2, height: 3))
    XCTAssertTrue(Device.iPhone5.screenRatio == (width: 9, height: 16))
    XCTAssertTrue(Device.iPhone5c.screenRatio == (width: 9, height: 16))
    XCTAssertTrue(Device.iPhone5s.screenRatio == (width: 9, height: 16))
    XCTAssertTrue(Device.iPhone6.screenRatio == (width: 9, height: 16))
    XCTAssertTrue(Device.iPhone6Plus.screenRatio == (width: 9, height: 16))
    XCTAssertTrue(Device.iPhone6s.screenRatio == (width: 9, height: 16))
    XCTAssertTrue(Device.iPhone6sPlus.screenRatio == (width: 9, height: 16))
    XCTAssertTrue(Device.iPhone7.screenRatio == (width: 9, height: 16))
    XCTAssertTrue(Device.iPhone7Plus.screenRatio == (width: 9, height: 16))
    XCTAssertTrue(Device.iPhoneSE.screenRatio == (width: 9, height: 16))
    XCTAssertTrue(Device.iPad2.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.iPad3.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.iPad4.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.iPadAir.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.iPadAir2.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.iPad5.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.iPadMini.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.iPadMini2.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.iPadMini3.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.iPadMini4.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.iPadPro9Inch.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.iPadPro12Inch.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.iPadPro12Inch2.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.iPadPro10Inch.screenRatio == (width: 3, height: 4))
    XCTAssertTrue(Device.simulator(device).screenRatio == device.screenRatio)
    XCTAssertTrue(Device.unknown("Not a device.").screenRatio == (width: -1, height: -1))
  }

  func testDiagonal() {
    XCTAssertEqual(Device.iPhone4.diagonal, 3.5)
    XCTAssertEqual(Device.iPhone4s.diagonal, 3.5)

    XCTAssertEqual(Device.iPodTouch5.diagonal, 4)
    XCTAssertEqual(Device.iPodTouch6.diagonal, 4)
    XCTAssertEqual(Device.iPhone5.diagonal, 4)
    XCTAssertEqual(Device.iPhone5c.diagonal, 4)
    XCTAssertEqual(Device.iPhone5s.diagonal, 4)
    XCTAssertEqual(Device.iPhoneSE.diagonal, 4)

    XCTAssertEqual(Device.iPhone6.diagonal, 4.7)
    XCTAssertEqual(Device.iPhone6s.diagonal, 4.7)
    XCTAssertEqual(Device.iPhone7.diagonal, 4.7)

    XCTAssertEqual(Device.iPhone6Plus.diagonal, 5.5)
    XCTAssertEqual(Device.iPhone6sPlus.diagonal, 5.5)
    XCTAssertEqual(Device.iPhone7Plus.diagonal, 5.5)

    XCTAssertEqual(Device.iPad2.diagonal, 9.7)
    XCTAssertEqual(Device.iPad3.diagonal, 9.7)
    XCTAssertEqual(Device.iPad4.diagonal, 9.7)
    XCTAssertEqual(Device.iPadAir.diagonal, 9.7)
    XCTAssertEqual(Device.iPadAir2.diagonal, 9.7)
    XCTAssertEqual(Device.iPad5.diagonal, 9.7)

    XCTAssertEqual(Device.iPadMini.diagonal, 7.9)
    XCTAssertEqual(Device.iPadMini2.diagonal, 7.9)
    XCTAssertEqual(Device.iPadMini3.diagonal, 7.9)
    XCTAssertEqual(Device.iPadMini4.diagonal, 7.9)

    XCTAssertEqual(Device.iPadPro9Inch.diagonal, 9.7)
    XCTAssertEqual(Device.iPadPro12Inch.diagonal, 12.9)
    XCTAssertEqual(Device.iPadPro12Inch2.diagonal, 12.9)
    XCTAssertEqual(Device.iPadPro10Inch.diagonal, 10.5)

    XCTAssertEqual(Device.simulator(.iPadPro10Inch).diagonal, 10.5)
    XCTAssertEqual(Device.unknown("Not a device.").diagonal, -1)
  }

  func testDescription() {
    XCTAssertEqual(Device.iPodTouch5.description, "iPod Touch 5")
    XCTAssertEqual(Device.iPodTouch6.description, "iPod Touch 6")
    XCTAssertEqual(Device.iPhone4.description, "iPhone 4")
    XCTAssertEqual(Device.iPhone4s.description, "iPhone 4s")
    XCTAssertEqual(Device.iPhone5.description, "iPhone 5")
    XCTAssertEqual(Device.iPhone5c.description, "iPhone 5c")
    XCTAssertEqual(Device.iPhone5s.description, "iPhone 5s")
    XCTAssertEqual(Device.iPhone6.description, "iPhone 6")
    XCTAssertEqual(Device.iPhone6Plus.description, "iPhone 6 Plus")
    XCTAssertEqual(Device.iPhone6s.description, "iPhone 6s")
    XCTAssertEqual(Device.iPhone6sPlus.description, "iPhone 6s Plus")
    XCTAssertEqual(Device.iPhone7.description, "iPhone 7")
    XCTAssertEqual(Device.iPhone7Plus.description, "iPhone 7 Plus")
    XCTAssertEqual(Device.iPhoneSE.description, "iPhone SE")
    XCTAssertEqual(Device.iPad2.description, "iPad 2")
    XCTAssertEqual(Device.iPad3.description, "iPad 3")
    XCTAssertEqual(Device.iPad4.description, "iPad 4")
    XCTAssertEqual(Device.iPadAir.description, "iPad Air")
    XCTAssertEqual(Device.iPadAir2.description, "iPad Air 2")
    XCTAssertEqual(Device.iPad5.description, "iPad 5")
    XCTAssertEqual(Device.iPadMini.description, "iPad Mini")
    XCTAssertEqual(Device.iPadMini2.description, "iPad Mini 2")
    XCTAssertEqual(Device.iPadMini3.description, "iPad Mini 3")
    XCTAssertEqual(Device.iPadMini4.description, "iPad Mini 4")
    XCTAssertEqual(Device.iPadPro9Inch.description, "iPad Pro (9.7-inch)")
    XCTAssertEqual(Device.iPadPro12Inch.description, "iPad Pro (12.9-inch)")
    XCTAssertEqual(Device.iPadPro12Inch2.description, "iPad Pro (12.9-inch) 2")
    XCTAssertEqual(Device.iPadPro10Inch.description, "iPad Pro (10.5-inch)")
    XCTAssertEqual(Device.simulator(Device.iPadPro10Inch).description, "Simulator (\(Device.iPadPro10Inch.description))")
    XCTAssertEqual(Device.unknown("Not a device.").description, "Not a device.")
  }

  func testIsPad() {
    Device.allPads.forEach { XCTAssertTrue($0.isPad) }
  }

  #endif

  // MARK: - tvOS
  #if os(tvOS)
  func testIsSimulator() {
    XCTAssertTrue(Device().isOneOf(Device.allSimulatorTVs))
  }

  func testDescriptionFromIdentifier() {
    XCTAssertEqual(Device.mapToDevice(identifier: "AppleTV5,3").description, "Apple TV 4")
  }
  #endif

}
