module ApplicationHelper
  def blog_or_root_path(blog)
    if blog
      link_to blog.name, blog_posts_path(blog), class: "nav-link"
    else
      link_to "Home", root_path, class: "nav-link"
    end
  end

  def flash_messages
    flash_keys = [:success, :info, :warning, :error]

    capture_haml do
      flash_keys.each do |key|

        if flash[key]
          haml_tag :div, class: ["alert","alert-success","alert-dismissible"], role: "alert" do
            haml_tag :span, "#{flash[key]}"
            haml_tag :button, {class: "close", "aria-label" => "Close", "data-dismiss" => "alert", :type => "button"} do
              haml_tag :span, "x", {"aria-hidden" => "true"}
            end
          end
        end
      end
    end
  end
end
