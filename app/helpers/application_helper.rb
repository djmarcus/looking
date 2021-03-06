module ApplicationHelper
include Rails.application.routes.url_helpers

  def cancel_link
    return link_to 'Cancel update', request.env["HTTP_REFERER"], 
      :class => 'cancel', 
      :confirm => 'Are you sure? Any changes will be lost.'
  end

  def logo
    logo_image = image_tag("LFIlogo.png", :alt => "Lookinforit.com", :class => "round")
  end

  # Return a title on a per-page basis.
  def title
    base_title = "I found it at Lookinforit.com"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
