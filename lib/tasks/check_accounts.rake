namespace :check do

  desc "Check all Twitter accounts"
  task :accounts => :environment do
    Account.all.each_with_index do |account, index|
      puts "checking #{account.username}"
      last_check = account.checks.last

      followers = account.current_followers
      following = account.current_following

      followers_added = followers - last_check.followers
      followers_removed = last_check.followers - followers
      following_added = following - last_check.following
      following_removed = last_check.following - following

      account.checks.create({
          following: following,
          followers: followers,
          followers_added: followers_added,
          followers_removed: followers_removed,
          following_added: following_added,
          following_removed: following_removed
        })

      accounts = followers_added + followers_removed + following_added + following_removed
      accounts.uniq!

      if accounts.length > 0

        accounts_info = account.client.users(accounts)

        accounts_info.each do |account|
          Profile.where({
            twitter_id: account.id,
            username: account.screen_name,
            description: account.description,
            avatar_url: account.profile_image_url.to_s,
            name: account.name}).first_or_create!
        end

      end

      sleep 10 if index != Account.count - 1
    end
  end

end