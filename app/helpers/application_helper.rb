module ApplicationHelper
  include ApplicationHelperExtend
  def truncated_name(client, user)
    if client.device_type == 'smartphone'
      user.fullname.split.select { |w| w.length <= 7 }.join(' ')

    else
      current_user.fullname
    end
  end

  def like_or_dislike_btn(deep)
    like = Like.find_by(deep: deep, user: current_user)
    if like
      link_to "<i class='bi bi-heart-fill d-inline-block like-button like-button-liked ms-1'></i>".html_safe,
              deep_like_path(deep, like), class: 'black-text likes-container', method: :delete
    else
      link_to "<i class='bi bi-heart-fill d-inline-block like-button follow-button ms-1'></i>".html_safe,
              deep_likes_path(deep), class: 'black-text likes-container', method: :post
    end
  end

  # Number of cols for the second-main-column

  def second_main_column_cols
    if user_signed_in?
      'col-10 p-0'
    else
      'col-12 p-0'
    end
  end

  def rails_admin_user?
    user_signed_in? && ((current_user.username == 'miguelDVX') || (current_user.username == 'meltrustDVX'))
  end

  def admin_link
    return unless rails_admin_user?

    content_tag :li, class: 'nav-item' do
      link_to 'Admin', rails_admin_path, class: 'nav-link fs-5 fw-bold nav-text-dark nav-item ms-md-3 ms-lg-0'
    end
  end

  def logout_link
    return unless user_signed_in?

    link_to 'Logout', destroy_user_session_path,
            class: 'nav-link fs-5 fw-bold nav-text-dark nav-item ms-md-3 ms-lg-0', method: :delete
  end

  def signup_link
    return if user_signed_in?

    link_to 'Sign up', new_registration_path(resource_name),
            class: 'nav-link fs-5 fw-bold nav-text-dark nav-item ms-md-3 ms-lg-0'
  end

  def notices
    return unless notice.present?

    content_tag :div, class: 'alert alert-info mb-0 alert-dismissible fade show', role: 'alert' do
      concat(content_tag(:p, notice, class: 'm-')) +
        concat('<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>'.html_safe)
    end
  end

  def alerts
    return unless alert.present?

    content_tag :div, class: 'alert alert-info mb-0 alert-dismissible fade show', role: 'alert' do
      concat(content_tag(:p, alert, class: 'm-')) +
        concat('<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>'.html_safe)
    end
  end

  def user_followers(userf)
    userf.followers.count
  end

  def user_followeds(userf)
    userf.followeds.count
  end

  def left_nav_home
    if current_user && !current_page?(root_path || deeps_path)
      link_to root_path, class: 'nav-text-dark nav-link fw-bold w-auto p-1 py-3 p-sm-3 data-toogle' do
        raw('<i class="bi bi-house-fill me-0 me-sm-2 ms-lg-4"></i>') +
          (content_tag :span, 'HOME', class: 'd-none d-md-inline-block p-md-0 p-lg-2')
      end
    elsif current_user && current_page?(root_path || deeps_path)
      link_to root_path,
              class: 'active text-white nav-link fw-bold w-auto p-1 py-3 p-sm-3 data-toogle' do
        raw('<i class="bi bi-house-fill me-0 me-sm-2 ms-lg-4"></i>') +
          (content_tag :span, 'HOME', class: 'd-none d-md-inline-block p-md-0 p-lg-2')
      end
    end
  end

  def left_nav_profile
    if current_user && !current_page?(user_path(current_user.id))
      link_to user_path(current_user.id),
              class: 'nav-text-dark nav-link fw-bold w-auto p-1 py-3 p-sm-3 data-toogle' do
        raw('<i class="bi bi-person-fill me-0 me-sm-2 ms-lg-4"></i>') +
          (content_tag :span, 'PROFILE', class: 'd-none d-md-inline-block p-md-0 p-lg-2')
      end
    elsif current_user && current_page?(user_path(current_user.id))
      link_to user_path(current_user.id),
              class: 'active text-white nav-link fw-bold w-auto p-1 py-3 p-sm-3 data-toogle' do
        raw('<i class="bi bi-person-fill me-0 me-sm-2 ms-lg-4"></i>') +
          (content_tag :span, 'PROFILE', class: 'd-none d-md-inline-block p-md-0 p-lg-2')
      end
    end
  end
end
