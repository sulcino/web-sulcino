module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, extensions = {
      fenced_code_blocks: true,
      tables: true,
      autolink: true
    })
    markdown.render(text).html_safe
  end
end
