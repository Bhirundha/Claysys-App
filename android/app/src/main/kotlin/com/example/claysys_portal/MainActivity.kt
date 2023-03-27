package com.example.claysys_portal

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
//    private val CHANNEL = "com.example.claysys_portal";
//    private lateinit var channel: MethodChannel
//    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
//        channel.setMethodCallHandler { call, result ->
//            val arguments = call.arguments as List<Map<String, Any>>
//            if (call.method == "getList") {
//                // val data = StringBuilder()
//
//                val designation = mutableListOf("")
//                val experience = mutableListOf("")
//                val detail = mutableListOf("")
//                val isvisible = mutableListOf("")
//
//                //val contacts = mutableListOf<Contacts>()
//                for (map in arguments) {
//                    designation.add(map["designation"].toString())
//                    experience.add(map["experience"].toString())
//                    detail.add(map["detail"].toString())
//                    isvisible.add(map["isvisible"].toString())
////                    val designation:List<String> = map["designation"].toString();
////                    val experience= listof(map["experience"].toString())
////                    val detail= listof(map["detail"].toString())
////                    val isvisible= listof(map["isvisible"].toString())
////                    val contact = Contacts(designation)
////                    contacts.add(contact)
//                }
//                println(designation)
//                println(experience)
//                println(detail)
//                println(isvisible)
//                // Log.d("MyTag", data.toString());
//            }
//        }
//    }
}


//data class Contacts(
//        val designation: String,
//        val experience: String ,
//        val detail: String,
//        val isvisible: String
//)

//private val CHANNEL = "com.example.claysys_portal";
//    private lateinit var channel: MethodChannel
//    override fun configureFlutterEngine(flutte
//    val designation: String,rEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
//        channel.setMethodCallHandler {
//            call, result ->
//            val arguments = call.arguments as List<Map<String, Any>>
//            if (call.method == "getList") {
//                val data = StringBuilder()
//                for (map in arguments) {
//                    data.append("Designation: ${map["designation"]}, " + "Experience: ${map["experience"]}, " + "Detail: ${map["detail"]}, " + "isVisible: ${map["isVisible"]}\n")
//                }
//                Log.d("MyTag", data.toString());
//            }
//        }
//    }


//val arguments = call.arguments as List<Map<String, Any>>
//if (call.method == "getList") {
//    val data = StringBuilder()
//    for (map in arguments) {
//        val designation= data.append("Designation: ${map["designation"]},\n")
//                    val experience= data.append("Experience: ${map["experience"]},\n")
//                    val detail= data.append("Detail: ${map["detail"]},\n")
//                    val isvisible= data.append("IsVisible: ${map["isvisible"]},\n")
//                    println(designation)
//                    println(experience)
//                    println(detail)
//                    println(isvisible)
//    }
//    Log.d("MyTag", data.toString());
//}