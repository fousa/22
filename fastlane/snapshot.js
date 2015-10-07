#import "SnapshotHelper.js"

var target = UIATarget.localTarget();
target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT);

// Show the information screen.
captureLocalizedScreenshot("1-Information")
target.frontMostApp().mainWindow().buttons()["Set your birthdate"].tap();

// Select my birthday.
target.frontMostApp().mainWindow().pickers()[0].wheels()[0].selectValue("June");
target.frontMostApp().mainWindow().pickers()[0].wheels()[1].selectValue("28");
target.frontMostApp().mainWindow().pickers()[0].wheels()[2].selectValue("1984");
captureLocalizedScreenshot("2-Birthdate")

// Show the counter screen.
target.frontMostApp().mainWindow().buttons()["Finish"].tap();
captureLocalizedScreenshot("0-Counter")

// Show the settings screen.
target.frontMostApp().mainWindow().buttons()["Settings"].tap();
captureLocalizedScreenshot("3-Settings")
