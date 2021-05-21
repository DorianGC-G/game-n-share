module ApplicationHelper
  def svg_tag(svg_name)
    render inline: Rails.root.join("app/assets/images/#{svg_name}").read
  end
end
