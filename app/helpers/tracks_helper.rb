module TracksHelper
  include ERB::Util

  def ugly_lyrics(lyrics)
    lyrics = h(lyrics)

    ugly_lyrics = "<pre>"
    lyrics.each_line do |line|
      ugly_lyrics += "&#9835; " + line unless line.blank?
    end

    (ugly_lyrics + "</pre>").html_safe
  end
end
