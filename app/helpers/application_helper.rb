module ApplicationHelper
  def markdown(text)
    renderer = CustomRenderer.new(hard_wrap: true, lax_html_blocks: true)
    markdown = Redcarpet::Markdown.new(renderer, extensions = {
      fenced_code_blocks: true,
      tables: true,
      autolink: true
    })
    markdown.render(text).html_safe
  end
end
