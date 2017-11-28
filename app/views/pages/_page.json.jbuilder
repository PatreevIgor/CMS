json.extract! page, :id, :title, :description, :slug, :menu_label, :h1, :content, :published_at, :priority, :created_at, :updated_at
json.url page_url(page, format: :json)
