# Seafile::Api

 make based on 

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

#### Shared Libraries
##### List Shared Libraries
        sf.list_shared_libraries
##### List Be Shared Libraries (need know what it do)
        sf.list_beshared_libraries
##### Share A Libraries
+ repo_id
+ share_type -> default value = group
+ user
+ permission -> default value = rw
+ group_id

        sf.share_library(repo_id,user,group_id,permission,share_type)
##### Unshared Libraries
+ repo id
+ share type
+ user
+ group id

        sf.unshare_library(repo_id,share_type,user,group_id)
#### Shared Files
##### List Shared Files
        sf.list_shared_files
##### Download Shared File
+ file token

        sf.shared_file_link(file_t)
##### Get Shared File Detail
+ file token

        sf.shared_file_detail(file_t)
##### Delete Shared File
+ file token

        sf.del_shared_file(file_t)
##### Download Private Shared File (need know what is private shared file)
+ file token

        sf.download_private_shared_file(file_t)
##### Get Private Shared File Detail
+ file token

        sf.private_shared_file_detail(file_t)

### Library
#### Library
##### Get Default Library
        sf.default_library

##### Create Default Library
        sf.create_default_library
##### List Libraries
        sf.list_libraries

##### Get Library Info
+ repo id

        sf.library_info(repo_id)

##### Get Library Owner
+ repo id

        sf.library_owner(repo_id)

##### Get library History
+ repo id

        sf.library_history(repo_id)

##### Create Library
+ name
+ desc -> default value = "new repo"
+ pwd -> default value = nil

    sf.create_library(name,desc="new repo",pwd=nil)

##### Check/Create Sub Library
+ repo id
+ name
+ path -> default value = '/'

        sf.create_sub_library(repo_id,name,p)

##### Delete Library
+ repo id

        sf.del_library(repo_id)

##### Decrypt Library
+ name
+ password

        sf.decrypt_library(repo_id,password)

##### Create Public Library
+ repo id

        sf.create_public_library(repo_id)

##### Remove Public Library
+ repo id

        sf.remove_public_library(repo_id)

##### Fetch library download info
+ repo id

        sf.fetch_library_info(repo_id)

##### List Virtual Libraries
        sf.list_virtual_libraries

##### Search Libraries (test on 3.0.3 server , doesn't support it)
+ keyword

        sf.search_libraries(keyword)

#### File
##### Download File
+ filename
+ repo -> default value = default repo

        sf.file_link(filename,repo)

##### Get File Detail
+ filename
+ repo -> default value = default repo

        sf.file_detail(filename,repo)

##### Get File History
+ filename
+ repo -> default value = default repo

        sf.file_history(filename,repo)

##### Download File From a Revision
+ filename
+ commit id
+ repo -> default value = default repo

        sf.link_revision(filename,commit_id,repo)

##### Create File
+ filename
+ repo -> default value = default repo

        sf.create_file(filename,repo=self.repo)

##### Rename File
+ old name
+ new name
+ repo -> default value = default repo

        sf.rename_file(old_name,new_name,repoo)

##### Move File
+ filename
+ destination dir -> default value = '/'
+ destination repo -> default value = default repo
+ source repo -> default value = default repo

        sf.move_file(filename,dst_dir,dest_repo,src_repo)


##### Copy File
+ filename
+ destination dir -> default value = '/'
+ destination repo -> default value = default repo
+ source repo -> default value = default repo

        sf.copy_file(filename,dst_dir,dest_repo,src_repo)

##### Delete File
+ filename
+ repo -> default value = default repo

        sf.del_file(filename,repo)

##### Upload File
+ filename
+ repo -> default value = default repo

        sf.upload_file(file,repo=self.repo)

##### Update File
+ filename
+ target file -> default value = as filename
+ repo -> default value = default repo

        sf.update_file(file,target_file,repo)

##### Get Upload Blocks link
+ repo -> default value = default repo

        sf.block_link(repo)

#### Directory
##### List Directory Entries
+ path -> default value = '/'
+ repo -> default value = default repo

        sf.list_dir_entry(path,repo)

##### Create New Directory
+ path
+ repo -> default value = default repo

        sf.create_dir(path,repo)

##### Delete Directory
+ path
+ repo -> default value = default repo

        sf.del_dir(path,repo)

##### Download Directory
+ path
+ repo -> default value = default repo

        sf.download_dir(path,repo)

##### Share Directory
+ email
+ path
+ repo -> default value = default repo
+ perm -> default value = 'r'
+ s type -> default value = 'd'

        sf.share_dir(email,path,perm,repo,s_type)

### Seafile

## Contributing

1. Fork it ( http://github.com/<my-github-username>/seafile-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
