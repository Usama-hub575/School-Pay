package com.paynest.schoolpay;

import androidx.annotation.NonNull;

import java.util.Map;

import io.flutter.embedding.android.FlutterFragmentActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterFragmentActivity {
    private static final String CHANNEL_METHOD_LEAN = "com.paynest.schoolpay.lean";
    Map<String, String> response;
    String appToken;
    String customerID;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL_METHOD_LEAN).setMethodCallHandler(
                (call, result) -> {
                    appToken = call.argument("appToken");
                    customerID = call.argument("customerID");
                    if (call.method.equals("getLeanConnectResponse")) {
                        response = getLeanConnectResponse(appToken, customerID);
                    }
                    result.notImplemented();
                    return;
                }
        );
    }

    public Map<String, String> getLeanConnectResponse(String appToken, String customerID) {

        return response;
    }


}
