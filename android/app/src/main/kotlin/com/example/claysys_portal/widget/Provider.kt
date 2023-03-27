package com.example.claysys_portal.widget


import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.embedding.engine.dart.DartExecutor
import com.example.claysys_portal.R
import android.content.Intent;
import android.net.Uri


class WidgetProvider : AppWidgetProvider() {
    private val Channel = "com.example.claysys_portal"
    override fun onUpdate(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetIds: IntArray
    ) {
        val flutterEngine = FlutterEngine(context)
        flutterEngine.dartExecutor.executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
        )
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, Channel)
                .setMethodCallHandler { call, result ->
                    if (call.method == "getList") {
                        val contactList = call.argument<List<Map<String, Any>>>("contacts")
                        val contacts = mutableListOf<Contact>()
                        for (contactMap in contactList!!) {
                            val designation = contactMap["designation"] as String
                            val experience = contactMap["experience"] as String
                            val detail = contactMap["detail"] as String
                            val isvisible = contactMap["isvisible"] as String

                            val contact = Contact(designation, experience, detail, isvisible)
                            contacts.add(contact)
                        }
                        result.success(null)
                        val designationArray = Array(contacts.size) { i -> contacts[i].designation }
                        val experienceArray = Array(contacts.size) { i -> contacts[i].experience }
                        val detailArray = Array(contacts.size) { i -> contacts[i].detail }
                        val isvisibleArray = Array(contacts.size) { i -> contacts[i].isvisible }

                        val designationData = designationArray.joinToString()
                        val experienceData = experienceArray.joinToString()
                        val detailData = detailArray.joinToString()
                        val isvisibleData = isvisibleArray.joinToString()

                        RemoteViews(
                                context.packageName,
                                R.layout.widget_layout
                        ).apply {
                            val svcIntent = Intent(context, WidgetService::class.java)
                            svcIntent.putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, appWidgetIds)
                            svcIntent.data = Uri.parse(svcIntent.toUri(Intent.URI_INTENT_SCHEME))
                            svcIntent.putExtra(context.getString(R.string.designation_data), designationData)
                            svcIntent.putExtra(context.getString(R.string.experience_data), experienceData)
                            svcIntent.putExtra(context.getString(R.string.detail_data), detailData)
                            svcIntent.putExtra(context.getString(R.string.isvisible_data), isvisibleData)

                            setRemoteAdapter(
                                    R.id.words,
                                    svcIntent
                            )
                            appWidgetManager.updateAppWidget(appWidgetIds, this)
                        }
                    } else {
                        result.notImplemented()
                    }
                }
    }
}

