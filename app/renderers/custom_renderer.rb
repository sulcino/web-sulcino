class CustomRenderer < Redcarpet::Render::HTML
  def paragraph(text_to_render)
    if text_to_render.strip =~ /\A<img.*>\z/
      text_to_render
    else
      "<p>#{text_to_render}</p>"
    end
  end
end
