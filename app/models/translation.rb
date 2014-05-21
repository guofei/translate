class Translation
  include ActiveModel::Model
  attr_accessor :article_id, :name, :email, :message
  attr_writer :text, :version

  validates :article_id, presence: true

  def init_bare
    Grit::Repo.init_bare(git_path)
    wiki.write_page(title, :txt, @text, commit)
  end

  # default to get latest data
  def text
    p = @version == nil ? lastest_page : page
    p.raw_data
  end

  def versions
    lastest_page.versions
  end

  def update_page
    wiki.update_page(lastest_page, lastest_page.name, lastest_page.format, @text, commit)
  end

  private

  def commit
    @message ||= ""
    @name ||= "guest"
    @email ||= "guest@guest.com"
    { message: @message, name: @name, email: @email }
  end

  def wiki
    wiki = Gollum::Wiki.new(git_path)
  end

  def lastest_page
    page = wiki.page(title)
  end

  def page
    wiki.page(title, @version)
  end

  def title
    @title ||= Article.find(@article_id).title
  end

  def git_path
    Rails.application.secrets.git_path + "/#{Time.now.year}/#{Time.now.month}/#{@article_id}.git"
  end
end
