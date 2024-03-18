# Allow direct access to `title` from the Sitepress::Resource class
module Sitepress
  class Resource
    def title
      data.fetch("title", request_path)
    end
  end
end
