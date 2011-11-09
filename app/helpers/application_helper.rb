module ApplicationHelper

  def logo
    logo_image = image_tag("LFIlogo.png", :alt => "Lookinforit.com", :class => "round")
  end

  # Return a title on a per-page basis.
  def title
    base_title = "Lookinforit.com sample app"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
