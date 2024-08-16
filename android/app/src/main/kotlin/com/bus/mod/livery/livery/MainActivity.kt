package com.bus.mod.livery.livery

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContracts
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example/file_opener"
    private lateinit var openDocumentLauncher: ActivityResultLauncher<Array<String>>

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "openPdf" -> {
                        val filePath = call.argument<String>("filePath")
                        filePath?.let {
                            openPdf(filePath)
                            result.success(null)
                        } ?: run {
                            result.error("INVALID_ARGUMENT", "File path is required", null)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }

    private fun openPdf(filePath: String) {
        val fileUri = Uri.parse(filePath)
        val intent = Intent(Intent.ACTION_VIEW).apply {
            setDataAndType(fileUri, "application/pdf")
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        }
        startActivity(Intent.createChooser(intent, "Open PDF"))
    }
}
