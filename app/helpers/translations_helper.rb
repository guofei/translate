module TranslationsHelper
  def version_info(v)
    date = v.authored_date
    name = v.author.name
    ip_reg = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/
    if ip_reg =~ name
      name = name.gsub(/[0-9]+$/, "*")
    end
    "#{date},  translated by #{name}"
  end

  def version_short(v)
    "#{v.id[0..6]}"
  end
end
