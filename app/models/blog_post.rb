class BlogPost < ApplicationRecord
  belongs_to :user

  has_many :blog_post_tags, dependent: :destroy
  has_many :tags, through: :blog_post_tags

  default_scope { order(created_at: :desc) }

  def rendered_preview_text(locale: I18n.locale)
    render_text(:preview_text, locale: locale).html_safe
  end

  def rendered_text(locale: I18n.locale)
    render_text(:text, locale: locale).html_safe
  end

  def title(locale: I18n.locale)
    text_method = "title_#{locale}"
    respond_to?(text_method) ? send(text_method) : title_en
  end

  private

  def render_text(type = :text, locale:)
    text_method = "#{type}_#{locale}"
    text = respond_to?(text_method) ? send(text_method) : text_en
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)
    markdown.render(text)
  end
end
