# Tweet

Tweet application serves as a simple Twitter Client application.

## Features

* User authentication via Twitter.
* View user followers list.
* View follower's equivalent information and latest tweets.

## Structure

### Groups
* Networking : Contains all networking managers, model objects and support helper classes to cache/retrieved model objects.
* UI: Contains all required views, view controllers, view configurations, and navigaiton helper classes.
* Categories: Contains all extensions to facilitate the different tasks related to different classes.

### Design Pattern
* The project supports a blend of MVC and MVVM design patterns.

## Operation

### Authentication
* Twitter kit login method is utilized for user authentication upon tapping on the sign in button in the LoginViewController. A User model object is created and cached after successful login.

### Followers
* The user id (cached with the user object) is utilized for obtaining the authenticated user list of followers via the swifter pod. Upon success, an array of TWFollower model objects is returned in the equivalent success completion handler.
* The retrieved TWFollower model objects are cached via the TWFollowersHelper and retrieved upon new load of the view controller.
* The FollowersTableViewController supports infinite scrolling (i.e: twitter cursoring)

### Follower Information
* The equivalent follower object is passed to the FollowerInformationTableViewController.
* The id of the equivalent user is utilized to get the follower's latest tweets via the Swifter POD.
* Upon network call success an array of Tweet model objects is returned in the equivalent success completion handler.

## Pods

* SVProgressHUD : Pod file to view/dismiss progress huds with network calls.
* Networking: Pod file to exectue HTTP requests.
* TwitterKit: Pod file to include twitter functionalities.
* Swifter:  A Twitter framework for iOS & OS X written in Swift.
* ModelMapper: Pod file to convert JSON to strongly typed objects.
* SDWebImage: Pod file to download and cache images.

## Important Notes
* An attempt was made to execute network calls with Twitter's APIs with manual OAuth implementation and handling HTTP requests with Networking pod, but it needs further testing due to relentless output of code 32 "authentication failure" when attempting to call any of Twitter's APIs. This is elaborated in Networking/Managers/TWHTTPSessionManager. An object model was developed "NetworkParameter" for the sake of this tasl -> Networking/Models/NetworkParameter.
* Swifter pod was utilized to execute all networking calls with Twitter APIs.
