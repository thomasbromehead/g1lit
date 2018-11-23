module ApplicationHelper
  def user_avatar(id)
    our_user = User.find(id)
    our_user.avatar_data
  end

  def user_pseudo(id)
    our_user = User.find(id)
    our_user.pseudo_g1
  end

  def gravatar_for(user, options = { size: 80} )
  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  size = options[:size]
  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end

end
