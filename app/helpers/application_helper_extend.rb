module ApplicationHelperExtend
  def default_meta_tags
    {
      title: 'Home',
      site: 'Deeper',
      reverse: true,
      separator: '|',
      description: 'Share your daily wisdom',
      keywords: 'follow, wisdom, quotes',
      canonical: 'https://deeper-app.herokuapp.com/',
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
        url: 'https://deeper-app.herokuapp.com/',
        image: 'https://res.cloudinary.com/dvxcld/image/asset/v1627105360/meta-img-e0def810f2ec93ba67f683f3e22ec741.png',
        width: '1200', height: '630'
      }
    }
  end

  def users_meta_tags(user)
    set_meta_tags title: user.fullname,
                  description: "#{user.fullname.split[0]} is on Deeper! Share your daily wisdom",
                  twitter: {
                    card: 'summary',
                    title: user.fullname,
                    description: "#{user.fullname.split[0]} is on Deeper! Share your daily wisdom",
                    image: Cloudinary::Utils.cloudinary_url(user.photo.key, gravity: 'face', crop: 'fill',
                                                                            height: '1000', width: '1200')
                  },
                  og: {
                    title: user.fullname,
                    url: "https://deeper-app.herokuapp.com#{url_for(user_path(user))}",
                    description: "#{user.fullname.split[0]} is on Deeper! Share your daily wisdom",
                    image: Cloudinary::Utils.cloudinary_url(user.photo.key, gravity: 'face', crop: 'fill',
                                                                            height: '1000', width: '1200')
                  }
  end
end
