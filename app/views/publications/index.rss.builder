xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Новая газета кубани"
    xml.description "все новости"
    
    for publication in @publications
      if check_show(publication)
        xml.item do
          xml.title publication.title
          xml.description publication.body
          xml.pubDate publication.created_at.to_s(:rfc822)
        end
      end
    end
  end
end
