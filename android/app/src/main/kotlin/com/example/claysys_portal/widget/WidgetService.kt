package com.example.claysys_portal.widget


import android.content.Intent
import android.widget.RemoteViewsService

class WidgetService : RemoteViewsService() {
    override fun onGetViewFactory(intent: Intent): RemoteViewsFactory {
        return ExploreViewsFactory(
                this.applicationContext,
                intent
        )
    }
}
