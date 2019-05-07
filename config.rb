require "uglifier"

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Assests pipeline
activate :sprockets

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/partials/*", layout: false
page "/admin/*", layout: false

helpers do
  def markdown(content)
    Tilt['markdown'].new(context: @app) { content }.render
  end
end


activate :blog do |blog|
  blog.name = "products"
  blog.permalink = "products/{title}"
  blog.sources = "products/{title}"
  blog.per_page = 10
  blog.page_link = "page/{num}"
  blog.layout = "layouts/product-layout"
end

configure :build do
  # Minify css on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript, :ignore => "**/admin/**", compressor: ::Uglifier.new(mangle: true, compress: { drop_console: true }, output: {comments: :none})

  # Use Gzip
  activate :gzip

  #Use asset hashes to use for caching
  #activate :asset_hash

end

configure :development do
  set :debug_assets, true
  activate :relative_assets
  require 'rack/middleman/optional_html'
    use ::Rack::OptionalHtml,
      root: 'source/',
      urls: %w[/]
end