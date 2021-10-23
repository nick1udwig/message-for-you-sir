# Message For You, Sir

![Message for you, sir.](/assets/message-for-you-sir.png)

## Purpose

You have multiple ships -- say one social ship, one group hosting ship, one software distribution ship.
It would be nice if you didn't have to check all your ships for messages.
Let's forward messages received by ships to your main ship.

How?

Create a private group.
Join it with each of your ships you wish to forward messages from, as well as the ship you will be checking messages from (say, your social ship).
Install this Gall app on each of your ships except the main one.
Tell this app to post messages when you receive new messages on each ship:
```
:mfys [%set-graph-to-post-to [~sampel-palnet %graph-name]]
```
where `~sampel-palnet` and `%graph-name` should be replaced by the host and channel name the messages should be posted to.
The app will copy messages received by these ships into the group.

## Project status

Work in progress.
Ideally, this app should publish the message (or a user-friendly message) to the group chat.
Currently, it will publish a notification that a new ship has requested to start a DM.
It will not notify you if a ship that has already been DMing you DMs you again.
