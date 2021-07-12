module UsersHelper
  def icon(user)
    if user.image.attached?
      image_tag(user.image, class: 'img-responsive w-100 h-100 custom-circle')
    else
      image_tag 'user.png', class: 'user_avatar'
    end
  end
end
