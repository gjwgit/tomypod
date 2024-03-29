# To My Pod

An Android app to transfer data from apps on Android that do not yet
support Pods to a store on my Pod so that an ecosystem of apps can
access and utilise that data.

Eventually, add issues to the different open source apps for a feature
request to support Solid Pods. Though apps like OpenTracks have as a
feature that it does not connect to the Internet so ToMyPod is a good
adjunct although so is Nextcloud which is supported

## Target Apps

+ [Track & Graph](https://github.com/SamAmco/track-and-graph)
+ [OpenTracks](https://github.com/OpenTracksApp/OpenTracks)
+ Fitbit

## Design

Each app, like OpenTracks, has format options for the data store,
often a standard format. On your Solid Pod there will be a folder for
the app, like `opentracks` into which the data will be stored,
encrypted. The data is then available to any app on the Solid Pod
ecosystem. Such apps might display the trails recorded, perform
analysis of exercise, etc.
