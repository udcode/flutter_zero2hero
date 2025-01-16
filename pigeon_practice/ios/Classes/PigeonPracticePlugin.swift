import Flutter
import UIKit

public class PigeonPracticePlugin: NSObject, FlutterPlugin {
 private static var callback: ChatCallback?
 
  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = PigeonPracticePlugin()
    callback = ChatCallback(binaryMessenger: registrar.messenger())
    let api = ChatApiImpl(database: MessageDatabase())
    ChatApiSetup.setUp(binaryMessenger: registrar.messenger(), api: api)
    
  }
}
