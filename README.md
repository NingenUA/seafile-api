# Seafile::Api

## Installation

Add this line to your application's Gemfile:

    gem 'seafile-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install seafile-api

## Usage

### Initialize
    require 'seafile-api'
    sf = SeafileApi::Connect.new(user_name,password,host,default_repo)

### Configuration
    sf.user_name = email
    sf.password = password
    sf.host = https://seafile.com
    sf.repo = repo id

## Seafile-Api Methods
### Work with account
#### List Accounts
    sf.list_accounts

#### Check Account info
    sv.account_info

#### Create Account
+ email
+ password

    sf.create_accounts(email,pass)

#### Update Account
+ email
+ password

    sf.update_account(email,pass)

#### Delete Account

    sf.del_account(email)

### Starred Files
#### List starred files
#### Star a File
+ file
+ repo_id -> default value = default repo

    sf.star_a_file(file,repo_id)

#### UnStar a File
+ file
+ repo_id -> default value = default repo

    sf.unstar_a_file(file,repo_id)

### User Messages
#### List User Messages
+ to email

    sf.list_user_message(to_email)

#### Reply A User Message
    sf.unread_message

#### Count Unseen Message
+ to email
+ message

    sf.reply_user_message(to_email,message)

### Group
#### List Groups
    sf.list_groups
#### Add A Group
+ group name

    sf.add_group(group_name)

#### Group Member
##### Add a Group Member
+ user email
+ group id

    sf.add_group_member(user_email,group_id)

##### Delete a Group Member
+ user email
+ group id

    sf.del_group_member(user_email,group_id)

#### Group Message

##### Get Group Messages
+ group id

    sf.group_messages(group_id)

##### Get Group Messages Detail
+ group id
+ message id

    sf.group_message_detail(group_id,msg_id)

##### Send A Group Message
+ group id
+ message
+ repo id -> default value = default repo
+ path -> default value = '/'

    sf.send_group_message(group_id,message,repo_id,path)

##### Reply A Group Message
+ group id
+ message
+ message id

    sf.reply_group_message(group_id,message,msg_id)

##### Get Group Message Replies
    sf.group_messages_replies

### Share
#### File Share Link
##### List File Share Links
    sf.list_file_share_link

##### Create File Share Link
+ file
+ repo_id -> default value = default repo

    sf.create_file_share_link(file,repo_id=self.repo)

##### Delete File Share Link
+ shared token

    sf.delete_share_link(shared_t)

####

###Seafile

## Contributing

1. Fork it ( http://github.com/<my-github-username>/seafile-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
