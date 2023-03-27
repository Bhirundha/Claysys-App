package com.example.claysys_portal.widget

import android.appwidget.AppWidgetManager;
import android.content.Context;
import android.content.Intent;
import android.widget.RemoteViews;
import android.widget.RemoteViewsService;
import com.example.claysys_portal.R

class ExploreViewsFactory(ctxt: Context?, intent: Intent) : RemoteViewsService.RemoteViewsFactory {
    private var ctxt: Context? = null
    private val appWidgetId: Int
    private var contactItemList: ArrayList<Contacts>
    override fun onCreate() {}

    override fun onDestroy() {
        contactItemList.clear();
    }

    override fun getCount(): Int {
        return contactItemList.size
    }

    override fun getViewAt(position: Int): RemoteViews {
        val row = RemoteViews(
                ctxt!!.packageName,
                R.layout.widget_item_layout
        ).apply {
            setTextViewText(R.id.designation_view, contactItemList[position].designation)
            setTextViewText(R.id.experience_view, contactItemList[position].experience)
            setTextViewText(R.id.detail_view, contactItemList[position].detail)
            setTextViewText(R.id.isvisible_view, contactItemList[position].isvisible)
        }

        return row
    }

    override fun getLoadingView(): RemoteViews? {
        return null
    }

    override fun getViewTypeCount(): Int {
        return 1
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    override fun hasStableIds(): Boolean {
        return true
    }

    override fun onDataSetChanged() {
        // no-op
    }

    init {
        this.ctxt = ctxt
        appWidgetId = intent.getIntExtra(
                AppWidgetManager.EXTRA_APPWIDGET_ID,
                AppWidgetManager.INVALID_APPWIDGET_ID
        )
        contactItemList = ArrayList()

        val designationData = intent.getStringExtra(ctxt?.getString(R.string.designation_data))?.split(",") ?: emptyList()
        val experienceData = intent.getStringExtra(ctxt?.getString(R.string.experience_data))?.split(",") ?: emptyList()
        val detailData = intent.getStringExtra(ctxt?.getString(R.string.detail_data))?.split(",") ?: emptyList()
        val isvisibleData = intent.getStringExtra(ctxt?.getString(R.string.isvisible_data))?.split(",") ?: emptyList()

        for (i in 0..(designationData!!.size-1)) {
            contactItemList.add(
                    Contacts(
                            designation = designationData[i],
                            experience= experienceData[i],
                            detail = detailData[i],
                            isvisible = isvisibleData[i],
                            )
            )
        }
    }
}


data class Contacts(
        val designation: String,
        val experience: String ,
        val detail: String,
        val isvisible: String

)
