class PageModel < Sitepress::Model
  include ModelRelationships

  data :title, :breadcrumb
end
