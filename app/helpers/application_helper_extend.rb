module ApplicationHelperExtend
  def default_meta_tags
    {
      title: 'Home',
      site: 'Deeper',
      reverse: true,
      separator: '|',
      description: 'Share your daily wisdom',
      keywords: 'follow, wisdom, quotes',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      twitter: {
        card: 'summary_large_image',
        site: 'Deeper',
        title: 'Deeper',
        description: 'Share your daily wisdom',
        image: 'https://res.cloudinary.com/dvxcld/image/asset/v1627105360/meta-img-e0def810f2ec93ba67f683f3e22ec741.png',
        width: '1200', height: '630'
      },
      og: {
        title: 'Deeper',
        description: 'Share your daily wisdom',
        type: 'website',
        url: request.original_url,
        image: 'https://res.cloudinary.com/dvxcld/image/asset/v1627105360/meta-img-e0def810f2ec93ba67f683f3e22ec741.png',
        width: '1200', height: '630'
      }
    }
  end
end
