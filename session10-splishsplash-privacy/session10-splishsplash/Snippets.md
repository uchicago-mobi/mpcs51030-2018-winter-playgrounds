#  Privacy Screen
```
func applicationDidEnterBackground(_ application: UIApplication) {
print("Entering background")

let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
let controller = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController

// True hides the button and dismisses
controller.autoDismiss = false

let vc = topController()
vc.present(controller, animated: false, completion: nil)
}
```
# Settings #
```
/// Set default values for user settings.  This is safe to call over and over
/// again.  You will not rewrite your defaults
///

fileprivate func prepareDefaultSettings() {
let userDefaults = UserDefaults.standard
let defaults = [ "firstLaunch": true,
"name_preference" : "Johnny Appleseed",
"slider_preference" : 1.0 ] as [String : Any]
userDefaults.register(defaults: defaults)
userDefaults.synchronize()
print(userDefaults.dictionaryRepresentation())
}
```

```

//    prepareDefaultSettings()
//
//    // Show onboarding on first launch
//    let firstLaunch = UserDefaults.standard.bool(forKey: "firstLaunch")
//    if firstLaunch  {
//      print("Show onboarding")
//    }
```
