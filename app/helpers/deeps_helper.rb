module DeepsHelper
  def new_deeps_header(timeline_deeps)
    if timeline_deeps.count.positive?
      "#{timeline_deeps.count} NEW DEEPS"
    else
      'NO DEEPS YET'
    end
  end

  def deep_likes_counter(deep)
    deep.likes.count if deep.likes.count.positive?
  end
end
