module PostsHelper
  def format_post_title(post)
    "#{truncate(post.title, length: 50)}"
  end

  def formatted_content(post)
    simple_format(h(post.content))
  end

  def post_media_gallery(post)
    return unless post.media.attached?

    content_tag(:div, class: "row g-2") do
      post.media.map do |media|
        content_tag(:div, class: "col-md-4") do
          if media.content_type.starts_with?("image/")
            image_tag(media.variant(resize_to_limit: [ 400, 300 ]), class: "img-fluid rounded shadow-sm")
          else
            video_tag(url_for(media), controls: true, class: "w-100")
          end
        end
      end.join.html_safe
    end
  end
end
