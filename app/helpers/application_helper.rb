module ApplicationHelper
  def user_avatar(id)
    our_user = User.find(id)
    our_user.avatar_data
  end
  def user_pseudo(id)
    our_user = User.find(id)
    our_user.pseudo_g1
  end
end
