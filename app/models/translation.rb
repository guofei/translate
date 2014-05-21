class Translation
  include ActiveModel::Model
  attr_accessor :article_id
  attr_writer :text

  validates :article_id, presence: true

  def init_bare
    Grit::Repo.init_bare(git_path)
    wiki = Gollum::Wiki.new(git_path)
    wiki.write_page(title, :txt, @text)
  end

  # default to get latest data
  def text(commit = nil)
    wiki = Gollum::Wiki.new(git_path)
    page = commit == nil ? wiki.page(title) : wiki.page(title, commit)
    page.raw_data
  end

  def versions
    wiki = Gollum::Wiki.new(git_path)
    page = wiki.page(title)
    page.versions
  end

  def update_page
    wiki = Gollum::Wiki.new(git_path)
    page = wiki.page(title)
    wiki.update_page(page, page.name, page.format, @text)
  end

  private

  def title
    @title ||= Article.find(@article_id).title
  end

  def git_path
    Rails.application.secrets.git_path + "/#{@article_id}/#{@article_id}.git"
  end
end
