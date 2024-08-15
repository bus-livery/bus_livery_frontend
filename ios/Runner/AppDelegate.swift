import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      let channelName = "livery_channel"
      
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      
      let methodChannel = FlutterMethodChannel(name: channelName,
                                                   binaryMessenger: controller.binaryMessenger)

         methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
           if call.method == "livery" {
             result("ios method channel worked")
           } else {
             result(FlutterMethodNotImplemented)
           }
         }

      
      
      
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
