# Trackping

[Trackping](http://www.trackping.com) is a Rails app to track follows and unfollows for accounts on Twitter.

For example:

- New accounts the account follows
- New accounts that follow the account
- Accounts the account unfollows
- Accounts that unfollow the account

## View

It's live at http://www.trackping.com.

![screenshot](http://i.imgur.com/DG0gDvk.jpg)

## Setup

Create a `application.yml` with the needed environment keys. If you are using Heroku, these can be added to the production app with `rake figaro:heroku`.

After pushing to Heroku, use the scheduling add-on to run the `rake check:accounts` at the interval you want.


