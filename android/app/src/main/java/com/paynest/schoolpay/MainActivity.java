package com.paynest.schoolpay;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterFragmentActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import me.leantech.link.android.Lean;

public class MainActivity extends FlutterFragmentActivity {
    private static final String CHANNEL_METHOD_LEAN = "com.paynest.schoolpay.lean";
    Map<String, String> response;
    String appToken;
    String customerID;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL_METHOD_LEAN).setMethodCallHandler(
                (call, result) -> {
                    appToken = call.argument("appToken");
                    customerID = call.argument("customerID");
                    ArrayList<Lean.UserPermissions> permissions = new ArrayList<>();
                    permissions.add(Lean.UserPermissions.IDENTITY);
                    permissions.add(Lean.UserPermissions.TRANSACTIONS);
                    permissions.add(Lean.UserPermissions.BALANCE);
                    permissions.add(Lean.UserPermissions.ACCOUNTS);

                    Lean.Customization linkCustomization = new Lean.Customization();

                    Lean lean = new Lean.Builder()
                            .setAppToken(appToken)
                            .setVersion("latest")
                            .showLogs()
                            .sandboxMode(true)
                            .build();

                    lean.connect(this, customerID, "","",permissions, linkCustomization, "","", new Lean.LeanListener() {
                        @Override
                        public void onResponse(@NonNull Lean.LeanStatus leanStatus) {
                            Log.d("",leanStatus.toString());
                        }
                    });

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
