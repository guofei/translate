module ApplicationHelper
  @@markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML,
  filter_html: true,
  no_styles: true,
  autolink: true,
  space_after_headers: true,
  no_intra_emphasis: true,
  fenced_code_blocks: true,
  tables: true,
  hard_wrap: true,
  xhtml: true,
  lax_html_blocks: true,
  strikethrough: true

  def markdown(text)
    @@markdown.render(text).html_safe
  end

  def title(page_title)
    content_for :title, page_title.to_s
  end

  def navi(n)
    content_for :navi, n.to_s
  end
end
