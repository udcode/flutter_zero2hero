package com.udcode.pigeon.practice.pigeon_practice

import ChatApi
import ChatCallback
import Contact
import Message
import android.annotation.SuppressLint
import android.content.ContentResolver
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.provider.ContactsContract
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** PigeonPracticePlugin */
class PigeonPracticePlugin: FlutterPlugin, MethodCallHandler ,ChatApi, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
    private var callback: ChatCallback? = null
  private lateinit var database: MessagesDatabase
    private lateinit var applicationContext: Context


  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {

  ChatApi.setUp(flutterPluginBinding.binaryMessenger, this)
    applicationContext = flutterPluginBinding.applicationContext
    database = MessagesDatabase(flutterPluginBinding.applicationContext)
    callback = ChatCallback(flutterPluginBinding.binaryMessenger)



  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun getMessages(callback: (kotlin.Result<List<Message>>) -> Unit) {
    try {
      val messages = database.getAllMessages()
      callback(kotlin.Result.success(messages))
    } catch (e: Exception) {
      callback(kotlin.Result.failure(e))
    }
  }

  override fun sendMessage(message: Message, callback: (kotlin.Result<Unit>) -> Unit) {
    try {
      val sentMessage = Message(
        id = message.id,
        content = message.content,
        sender = message.sender,
        timestamp = message.timestamp,
        status = "sent"
      )
      database.saveMessage(sentMessage)


      Handler(Looper.getMainLooper()).postDelayed({
        val deliveredMessage = Message(
          id = message.id,
          content = message.content,
          sender = message.sender,
          timestamp = message.timestamp,
          status = "delivered"
        )
        database.saveMessage(deliveredMessage)
        this.callback?.onMessageStatusChanged(message.id!!, "delivered") { }
      }, 5000)

      Handler(Looper.getMainLooper()).postDelayed({
        val readMessage = Message(
          id = message.id,
          content = message.content,
          sender = message.sender,
          timestamp = message.timestamp,
          status = "read"
        )
        database.saveMessage(readMessage)
        this.callback?.onMessageStatusChanged(message.id!!, "read") { }
      }, 10000)

        callback(kotlin.Result.success(Unit))
    } catch (e: Exception) {

    }
  }

  @SuppressLint("Range")
  override fun getContacts(callback: (kotlin.Result<List<Contact>>) -> Unit) {
    try {
      val contacts = mutableListOf<Contact>()
      val contentResolver = applicationContext.contentResolver

      val projection = arrayOf(
        ContactsContract.Contacts._ID,
        ContactsContract.Contacts.DISPLAY_NAME,
        ContactsContract.Contacts.HAS_PHONE_NUMBER
      )

      contentResolver.query(
        ContactsContract.Contacts.CONTENT_URI,
        projection,
        null,
        null,
        null
      )?.use { cursor ->
        while (cursor.moveToNext()) {
          val hasPhone = cursor.getString(cursor.getColumnIndex(ContactsContract.Contacts.HAS_PHONE_NUMBER)).toInt()

          if (hasPhone > 0) {
            val id = cursor.getString(cursor.getColumnIndex(ContactsContract.Contacts._ID))
            val name = cursor.getString(cursor.getColumnIndex(ContactsContract.Contacts.DISPLAY_NAME))
            val phoneNumber = getPhoneNumber(contentResolver, id)

            contacts.add(Contact(
              id = id,
              name = name,
              phoneNumber = phoneNumber
            ))
          }
        }
        callback(kotlin.Result.success(contacts))
      }



    } catch (e: Exception) {
      callback(kotlin.Result.failure(e))
    }
  }

  override fun saveMessage(message: Message, callback: (kotlin.Result<Unit>) -> Unit) {
    try {
      database.saveMessage(message)

    } catch (e: Exception) {

    }
  }

  @SuppressLint("Range")
  private fun getPhoneNumber(contentResolver: ContentResolver, contactId: String): String {
    var phoneNumber = ""

    contentResolver.query(
      ContactsContract.CommonDataKinds.Phone.CONTENT_URI,
      null,
      "${ContactsContract.CommonDataKinds.Phone.CONTACT_ID} = ?",
      arrayOf(contactId),
      null
    )?.use { cursor ->
      if (cursor.moveToFirst()) {
        phoneNumber = cursor.getString(cursor.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER))
      }
    }

    return phoneNumber
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {



  }

  override fun onDetachedFromActivityForConfigChanges() {

  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

  }

  override fun onDetachedFromActivity() {



  }
}
