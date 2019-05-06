# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Assests pipeline
activate :sprockets 

configure :build do
  # Minify css on build
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript, :ignore => "**/admin/**", compressor: ::Uglifier.new(mangle: true, compress: { drop_console: true }, output: {comments: :none})

  # Use Gzip
  activate :gzip

  #Use asset hashes to use for caching
  #activate :asset_hash

end
