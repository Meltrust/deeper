module UsersHelper
  def cover_button(user)
    return unless current_user == user

    input_class = 'form-control form-control-sm d-none cover_form'

    form_with model: user, id: 'cover-form' do |form|
      concat(form.file_field(:cover_image, direct_upload: true, required: true,
                                           class: input_class, onchange: 'form.submit()')) +
        concat(content_tag(:button, 'change', id: 'cover-input', type: 'button',
                                              class: 'btn btn-outline-secondary btn-sm'))
    end
  end

  def cover_img(client, user)
    case client.device_type
    when 'desktop'
      cl_image_tag(user.cover_image.key, id: 'my-cover', class: 'img-fluid p-0 cover-img', width: 1200, height: 500,
                                         gravity: 'auto', crop: 'fill', effect: 'auto_brightness')
    when 'tablet'
      cl_image_tag(user.cover_image.key, id: 'my-cover', class: 'img-fluid p-0 cover-img', width: 700, height: 400,
                                         gravity: 'auto', crop: 'fill', effect: 'auto_brightness')

    else
      cl_image_tag(user.cover_image.key, id: 'my-cover', class: 'img-fluid p-0 cover-img', width: 500, height: 300,
                                         gravity: 'auto', crop: 'fill', effect: 'auto_brightness')
    end
  end

  def user_deeps_header(user)
    if user.deeps.count.positive?
      "ALL #{user.fullname.split.first}'s deeps"
    else
      "#{user.fullname.split.first} HAS NO DEEPS YET"
    end
  end

  def profile_pic_button(user)
    if current_user == user

      input_class = 'form-control form-control-sm d-none'

      form_with model: user, id: 'photo-form' do |form|
        concat(form.file_field(:photo, direct_upload: true, required: true,
                                       class: input_class, onchange: 'form.submit()')) +
          concat(content_tag(:button, 'change', id: 'photo-input', type: 'button',
                                                class: 'btn btn-outline-secondary btn-sm'))
      end
    elsif current_user.followeds.include?(user)
      link_to "<i class='position-relative fas fa-check-circle follow-button-pic follow-button-checked'></i>".html_safe,
              unfollow_user_path(user), class: 'follow-button-pic-container ', method: 'post'
    else

      link_to "<i class=' position-relative fas fa-plus-circle  follow-button-pic follow-button'></i>".html_safe,
              follow_user_path(user), class: 'follow-button-pic-container ', method: 'post'
    end
  end

  def followed_by_header(user)
    if user.followers.count.positive?
      'FOLLOWED BY'
    else
      'NO FOLLOWERS YET'
    end
  end

  def thumbs_follow_button(user)
    unfollow_btn_class = 'position-relative fas fa-check-circle follow-button-checked mt-3 mt-sm-2 mt-lg-2 mt-xxl-0 p-0'
    follow_btn_class = ' position-relative fas fa-plus-circle  follow-button mt-3 mt-sm-2 mt-lg-2 mt-xxl-0 p-0'
    if current_user == user
      nil
    elsif current_user.followeds.include?(user)
      link_to "<i class= '#{unfollow_btn_class}' ></i>".html_safe,
              unfollow_user_path(user), class: 'follow-button-pic-container follow-button', method: 'post'
    else
      link_to "<i class='#{follow_btn_class}'></i>".html_safe,
              follow_user_path(user), method: 'post'

    end
  end
end
