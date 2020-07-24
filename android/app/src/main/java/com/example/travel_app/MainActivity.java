package com.example.travel_app;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
      
    }
}


  // new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL).setMethodCallHandler(
        //     new MethodChannel.MethodCallHandler() {
        //         @Override
        //         public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        //             MainActivity.this.result = result;
        //             int count = methodCall.arguments();
        //             if (methodCall.method.equals(METHOD_SWITCH_VIEW)) {
        //                 onLaunchFullScreen(count);
        //             } else {
        //                 result.notImplemented();
        //             }
        //         }
        //     }
        // );

// new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
//         .setMethodCallHandler(
//                 (call, result) -> {
//                   if (call.method.equals("getPhoneCall")) {
//                     int batteryLevel = getPhoneCall();

//                     if (batteryLevel != -1) {
//                       result.success(batteryLevel);
//                     } else {
//                       result.error("UNAVAILABLE", "Battery level not available.", null);
//                     }
//                   } else {
//                     result.notImplemented();
//                   }
//                 }
//         );

//   @RequiresApi(api = Build.VERSION_CODES.M)
//   public int getPhoneCall() {
//     //To find SIM ID
//     String[] arrayPermission = new String[]{"android.permission.CALL_PHONE","android.permission.READ_PHONE_STATE"};
//     requestPermissions(arrayPermission,1);
//     try {

//       String primarySimId = "0", secondarySimId = "1";
//       SubscriptionManager subscriptionManager = (SubscriptionManager) getSystemService(Context.TELEPHONY_SUBSCRIPTION_SERVICE);
//       if (checkSelfPermission(Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {
//         return;
//       }
//       List<SubscriptionInfo> subList = subscriptionManager.getActiveSubscriptionInfoList();
//       int index = -1;
//       for (SubscriptionInfo subscriptionInfo : subList) {
//         index++;
//         if (index == 0) {
//           primarySimId = subscriptionInfo.getIccId();
//         } else {
//           secondarySimId = subscriptionInfo.getIccId();
//         }
//       }
//       System.out.println("SIM IDS " + primarySimId.toString());
//       System.out.println("SIM IDS " + secondarySimId.toString());
//       // TO CREATE PhoneAccountHandle FROM SIM ID
//       TelecomManager telecomManager = (TelecomManager) getSystemService(Context.TELECOM_SERVICE);

//       List<PhoneAccountHandle> list = telecomManager.getCallCapablePhoneAccounts();
//       PhoneAccountHandle primaryPhoneAccountHandle = null, secondaryPhoneAccountHandle = null;
//       for (PhoneAccountHandle phoneAccountHandle : list) {
//         if (phoneAccountHandle.getId().contains(primarySimId)) {
//           primaryPhoneAccountHandle = phoneAccountHandle;
//         }
//         if (phoneAccountHandle.getId().contains(secondarySimId)) {
//           secondaryPhoneAccountHandle = phoneAccountHandle;
//         }
//       }

//       //To call from SIM 1
//       Uri uri = Uri.fromParts("tel","4567891324657", "");
//       Bundle extras = new Bundle();
//       extras.putParcelable(TelecomManager.EXTRA_PHONE_ACCOUNT_HANDLE,primaryPhoneAccountHandle);
//       telecomManager.placeCall(uri, extras);

//       //To call from SIM 2
// //            Uri uri = Uri.fromParts("tel", "4567891324657", "");
// //            Bundle extras = new Bundle();
// //            extras.putParcelable(TelecomManager.EXTRA_PHONE_ACCOUNT_HANDLE, secondaryPhoneAccountHandle);
// //            telecomManager.placeCall(uri, extras);
//     }catch (Error error){
//       System.out.println("ERROR => "+error.getMessage());
//     }
//     return 0;
//   }