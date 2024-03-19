namespace :sitemap do
  # @note This task returns the following error:
  #
  #    Ping failed for Google: #<OpenURI::HTTPError: 404 Sitemaps ping is deprecated.
  #    See https://developers.google.com/search/blog/2023/06/sitemaps-lastmod-ping
  #    (URL http://www.google.com/webmasters/tools/ping?sitemap=https%3A%2F%2Fberry.sh%2Fsitemap.xml.gz)
  desc "Ping search engines about the sitemap"
  task ping_search_engines: :environment do
    SitemapGenerator::Sitemap.ping_search_engines("https://berry.sh/sitemap.xml.gz")
  end
end
