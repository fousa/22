#import "SnapshotHelper.js"

var target = UIATarget.localTarget();
target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT);

// Show the information screen.
captureLocalizedScreenshot("1-Information")
target.frontMostApp().mainWindow().buttons()["SET YOUR BIRTH YEAR"].tap();

// Select my birthday.
target.frontMostApp().mainWindow().pickers()[0].wheels()[0].selectValue("1984");
captureLocalizedScreenshot("2-Birthdate")

// Show the counter screen.
target.frontMostApp().mainWindow().buttons()["CALCULATE AGE"].tap();
captureLocalizedScreenshot("0-Counter")

// Show the settings screen.
target.frontMostApp().mainWindow().buttons()["Open settings"].tap();
target.frontMostApp().mainWindow().pickers()[0].wheels()[0].selectValue("1990");
captureLocalizedScreenshot("3-Settings")

// Show the settings screen.
target.frontMostApp().mainWindow().buttons()["Close settings"].tap();
captureLocalizedScreenshot("4-Counter")
