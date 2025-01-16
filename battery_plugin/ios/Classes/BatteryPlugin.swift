import Flutter
import UIKit

public class BatteryPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "battery_plugin", binaryMessenger: registrar.messenger())
    let instance = BatteryPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getBatteryLevel":
        receiveBatteryLevel(result:result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
  private func receiveBatteryLevel(result: FlutterResult) {
          let device = UIDevice.current
          device.isBatteryMonitoringEnabled = true
         
          if device.batteryState == UIDevice.BatteryState.unknown {
            result(FlutterError(code: "UNAVAILABLE",
                                message: "Battery level not available.",
                                details: nil))
          } else {
            result(Int(device.batteryLevel * 100))
          }
        }
}
