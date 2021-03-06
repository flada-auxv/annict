class PersonDecorator < ApplicationDecorator
  include PersonDecoratorCommon

  def db_detail_link(options = {})
    name = options.delete(:name).presence || self.name
    path = if h.user_signed_in? && h.current_user.committer?
      h.edit_db_person_path(self)
    else
      h.new_db_draft_person_path(person_id: id)
    end

    h.link_to name, path, options
  end

  def name_with_kana
    return name if name_kana.blank?
    "#{name} (#{name_kana})"
  end

  def twitter_username_link
    url = "https://twitter.com/#{twitter_username}"
    h.link_to "@#{twitter_username}", url, target: "_blank"
  end

  def wikipedia_url_link
    h.link_to "Wikipedia", wikipedia_url, target: "_blank"
  end

  def url_link
    h.link_to URI.parse(url).host.downcase, url, target: "_blank"
  end

  def background_color
    miyamori = "#d8a57a"
    zuka = "#ae454c"
    miyazuka = "#c57965" # miyamori, zukaとの中間色

    if voice_actor? && staff?
      miyazuka
    elsif voice_actor?
      zuka
    elsif staff?
      miyamori
    end
  end
end
