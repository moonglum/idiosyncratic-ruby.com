xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = "http://idiosyncratic-ruby.com/index/"
  xml.title "Idiosyncratic Ruby"
  xml.subtitle "Documentaing all Ruby Specialities. A New Post Every Day in May 2016!"
  xml.id URI.join(site_url, blog.options.prefix.to_s)
  xml.link "href" => URI.join(site_url, blog.options.prefix.to_s)
  xml.link "href" => URI.join(site_url, "https://feeds.feedburner.com/IdiosyncraticRuby"), "rel" => "self"
  xml.updated(blog.articles.first.date.to_time.iso8601) unless blog.articles.empty?
  xml.author { xml.name "Jan Lelis" }

  blog.articles.each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
      xml.id URI.join(site_url, article.url)
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "Jan Lelis" }
      xml.content article.body, "type" => "html"
    end
  end
end
