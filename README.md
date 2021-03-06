![RaceRunner](RaceRunner/logo.png "Logo by Moze")


RaceRunner
===================

**RaceRunner** is a run-tracking iPhone app focused on racing. Spectators can track the progress of runners during races. Spectators can start and stop timing of runs. Spectators can send messages to runners which are read aloud by the runner's phone. The app can stop timing a run automatically after a certain distance, which is useful for the time trials that runners conduct in preparation for races. The app can track shoe mileage and warn the user when mileage limits are exceeded.

I released **RaceRunner** to the [App Store](https://itunes.apple.com/us/app/racerunner-run-tracking-app/id1065017082) on April 21, 2016.

Notwithstanding my previous, positive [experience](https://itunes.apple.com/us/app/immigration/id777319358) with the pay-up-front business model, I decided to explore freemium with **RaceRunner**. The app is therefore free to download but two features, broadcasting of runs to spectators and use of an animated [horse](https://en.wikipedia.org/wiki/Eadweard_Muybridge#Stanford_and_horse_gaits) to represent the runner, are available via in-app purchases.

If you would like to build **RaceRunner** for yourself, follow these four easy steps:

1. Clone the repo.
2. Type `pod install` from the root of **RaceRunner** in Terminal.
3. Add API keys for Google Maps, Dark Sky, and PubNub to `Config.swift`.
4. Modify `UIView+Bezier.swift`, which is in the **COBezierTableView** CocoaPod, as shown below.

```swift
    public struct BezierPoints {
        static var p1 = CGPoint(x: -128, y: 0)
        static var p2 = CGPoint(x: 260, y: 374)
        static var p3 = CGPoint(x: -250, y: 168)
        static var p4 = CGPoint(x: 5, y: 480)
    }
```

###Run in Progress

Colors of the route indicate altitude changes.

![RaceRunner](RaceRunner/RaceRunner1.png "Run in Progress")


###Run Details

Colors of the route indicate pace changes.

![RaceRunner](RaceRunner/RaceRunner2.png "Run Details")


###Run Details

App looks great in landscape mode.

![RaceRunner](RaceRunner/RaceRunner2-1.png "Run Details")


###Graph of Pace and Altitude
![RaceRunner](RaceRunner/RaceRunner8.png "Graph of Pace and Altitude")


###Settings
![RaceRunner](RaceRunner/RaceRunner3.png "Settings")


###Spectating a Race in Germany from California
![RaceRunner](RaceRunner/RaceRunner4.png "Spectating a Race in Germany from California")


###Spectating a Walk in Vermont from California
![RaceRunner](RaceRunner/RaceRunner5.png "Spectating a Walk in Vermont from California")

###A Ski Run in the French Alps
![RaceRunner](RaceRunner/RaceRunner9.png "A Ski Run in the French Alps")


###Shoes
![RaceRunner](RaceRunner/RaceRunner6.png "Shoes")


###Horse IAP

User can unlock animated-horse IAP.

![RaceRunner](RaceRunner/RaceRunner10.png "Horse IAP")


###Main Menu
![RaceRunner](RaceRunner/RaceRunner7.png "Main Menu")


##Chromatic Inspiration
![Miami Vice](http://images2.fanpop.com/image/photos/9300000/Miami-VIce-Season-2-opener-miami-vice-9384840-765-580.jpg "Miami Vice")
