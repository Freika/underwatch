module UsersHelper
  def link_to_battlenet(user)
    link_to user.battletag, "https://playoverwatch.com/en-gb/career/pc/#{user.region}/#{user.battletag_slugified}"
  end

  def link_to_masteroverwatch(user)
    link_to user.battletag, "http://masteroverwatch.com/profile/pc/#{user.region}/#{user.battletag_slugified}"
  end
end
