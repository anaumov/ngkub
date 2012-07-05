xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Новая газета кубани"
    xml.description "новости читателей"
    
    for post in @posts
      if check_show(post)
        xml.item do
          xml.title post.title
          xml.description post.body
          xml.pubDate post.created_at.to_s(:rfc822)
        end
      end
    end
  end
end
