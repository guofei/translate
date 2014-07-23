class Translation
  include ActiveModel::Model
  attr_accessor :article_id, :name, :email, :message
  attr_writer :text, :version

  validates :article_id, presence: true

  def init_bare
    Grit::Repo.init_bare(git_path)
    wiki.write_page(page_name, :txt, @text, commit)
  end

  def article
    Article.find(article_id)
  end

  # default to get latest data
  def text
    p = @version == nil ? lastest_page : page
    p.raw_data
  end

  def version
    page.version
  end

  def versions
    lastest_page.versions
  end

  def update_page
    wiki.update_page(lastest_page, lastest_page.name, lastest_page.format, @text, commit)
  end

  def diff
    v = page.version
    arr = v.diffs
    if(arr.size > 0)
      arr[0].diff
    else
      ""
    end
  end

  private

  def commit
    @message ||= "translate"
    @name ||= "guest"
    @email ||= "guest@bittranslate.com"
    { message: @message, name: @name, email: @email }
  end

  def wiki
    Gollum::Wiki.new(git_path)
  end

  def lastest_page
    wiki.page(page_name)
  end

  def page
    wiki.page(page_name, @version)
  end

  def page_name
    @page_name ||= "#{article_id}"
  end

  def git_path
    Rails.application.secrets.git_path + "/#{article_id}.git"
  end
end
