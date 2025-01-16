package com.udcode.battery.plugin.battery_plugin

import android.content.BroadcastReceiver
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** BatteryPlugin */
class BatteryPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var eventChanel : EventChannel
  private lateinit var applicationContext: Context
  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "battery_plugin")
    eventChanel = EventChannel(flutterPluginBinding.binaryMessenger, "battery_event")



    channel.setMethodCallHandler(this)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    applicationContext = binding.activity.applicationContext
    eventChanel.setStreamHandler(BatteryStreamHandler(applicationContext))
  }

  override fun onDetachedFromActivityForConfigChanges() {

  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

  }

  override fun onDetachedFromActivity() {

  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "getBatteryLevel" -> {
        result.success(getBatteryLevel())
      }
      else ->
        result.notImplemented()
    }
  }
  private fun getBatteryLevel(): Int {
    val batteryLevel: Int
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
      val batteryManager = applicationContext.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    } else {
      val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(
        Intent.ACTION_BATTERY_CHANGED)
      )
      batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
    }

    return batteryLevel
  }


  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}

class BatteryStreamHandler(private val context: Context) : EventChannel.StreamHandler {
  private var eventSink: EventChannel.EventSink? = null
  private var batteryReceiver: BroadcastReceiver? = null

  override fun onListen(arguments: Any?, eventSink: EventChannel.EventSink?) {
    this.eventSink = eventSink
    batteryReceiver = createBatteryReceiver()

    // רישום ה-receiver לקבלת עדכוני סוללה
    val filter = IntentFilter().apply {
      addAction(Intent.ACTION_BATTERY_CHANGED)
      addAction(Intent.ACTION_BATTERY_LOW)
      addAction(Intent.ACTION_BATTERY_OKAY)
    }
    context.registerReceiver(batteryReceiver, filter)
  }

  override fun onCancel(arguments: Any?) {
    eventSink = null
    batteryReceiver?.let {
      context.unregisterReceiver(it)
      batteryReceiver = null
    }
  }

  private fun createBatteryReceiver(): BroadcastReceiver {
    return object : BroadcastReceiver() {
      override fun onReceive(context: Context, intent: Intent) {
        when (intent.action) {
          Intent.ACTION_BATTERY_CHANGED -> {
            val level = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
            val scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
            val batteryPct = level * 100 / scale.toFloat()

            val status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)
            val isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                    status == BatteryManager.BATTERY_STATUS_FULL

            val batteryInfo = mapOf(
              "percentage" to batteryPct,
              "isCharging" to isCharging
            )

            eventSink?.success(batteryInfo)
          }
          Intent.ACTION_BATTERY_LOW -> {
            eventSink?.success(mapOf("event" to "batteryLow"))
          }
          Intent.ACTION_BATTERY_OKAY -> {
            eventSink?.success(mapOf("event" to "batteryOkay"))
          }
        }
      }
    }
  }
}