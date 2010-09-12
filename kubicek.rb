require "rubygems"
require "sinatra"
require "lib/post"
require "lib/category"
require "rdiscount"
require "yaml"

get "/kdo-jsem/?" do
  erb :about
end

get "/temata/?" do
  @categories = Category.all
  erb :categories
end

get "/temata/:category_id" do
  @posts = Marley::Post.find_all_by_category(params[:category_id])
  throw :halt, [404, not_found ] unless @posts
  @page_title=Category.find(params[:category_id]).name
  @og_type="blog"
  erb :posts
end

get "/clanky/:post_id.html" do
  @post = Marley::Post[params[:post_id]]
  throw :halt, [404, not_found ] unless @post
  @post=Marley::Post.new(Marley::Post.extract_post_info_from(@post))
  @page_title=@post.title
  @og_type="article"
  erb :post
end

get "/clanky/:post_id/:filename" do
  directory = Dir['posts/*'].select { |dir| dir =~ Regexp.new("\\d\\d\\d\-#{Regexp.escape(params[:post_id])}\$") }.first
  file = Dir[File.join(directory,params[:filename])].first
  send_file(file)
end

get "/galerie/?" do
  erb :gallery
end

get "/kontakt/?" do
  erb :contact
end

get "/?" do
  @posts = Marley::Post.find_all
  @page_title="Úvod"
  erb :posts
end