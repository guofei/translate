module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s
  end

  def navi(n)
    content_for :navi, n.to_s
  end
end
