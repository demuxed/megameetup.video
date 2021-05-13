set :build_dir, 'build'
set :haml, :format => :html5
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/feed.xml", layout: false
page "/notfound.html", :directory_index => false
ignore 'CNAME'

activate :directory_indexes
activate :syntax, :line_numbers => true
# activate :gzip, {:exts => %w[.css .htm .html .js .json .mjs .svg .xhtml], :overwrite => true}

configure :development do
  activate :livereload
end

Haml::TempleEngine.disable_option_validator!
set :haml, {:ugly => true, :format => :html5 }
set :relative_links, true

configure :build do
  activate :asset_hash, :ignore => [/^assets\/downloads/, /^assets\/images\/brand/]
  activate :minify_css
  activate :minify_javascript
end
