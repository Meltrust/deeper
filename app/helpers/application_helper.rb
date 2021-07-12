module ApplicationHelper
  def left_nav_home
    if current_user && !current_page?(root_path || deeps_path)
      link_to root_path, class: 'nav-text-dark nav-link fw-bold w-auto p-1 py-3 p-sm-3 data-toogle' do
        raw('<i class="bi bi-house-fill me-0 me-sm-2 ms-lg-4"></i>') +
          (content_tag :span, 'HOME', class: 'd-none d-md-inline-block')
      end
    elsif current_user && current_page?(root_path || deeps_path)
      link_to user_path(current_user.id),
              class: 'active text-white nav-link fw-bold w-auto p-1 py-3 p-sm-3 data-toogle' do
        raw('<i class="bi bi-house-fill me-0 me-sm-2 ms-lg-4"></i>') +
          (content_tag :span, 'HOME', class: 'd-none d-md-inline-block')
      end
    end
  end

  def left_nav_profile
    if current_user && !current_page?(user_path(current_user.id))
      link_to user_path(current_user.id),
              class: 'nav-text-dark nav-link fw-bold w-auto p-1 py-3 p-sm-3 data-toogle' do
        raw('<i class="bi bi-person-fill me-0 me-sm-2 ms-lg-4"></i>') +
          (content_tag :span, 'PROFILE', class: 'd-none d-md-inline-block')
      end
    elsif current_user && current_page?(user_path(current_user.id))
      link_to user_path(current_user.id),
              class: 'active text-white nav-link fw-bold w-auto p-1 py-3 p-sm-3 data-toogle' do
        raw('<i class="bi bi-person-fill me-0 me-sm-2 ms-lg-4"></i>') +
          (content_tag :span, 'PROFILE', class: 'd-none d-md-inline-block')
      end
    end
  end
end
