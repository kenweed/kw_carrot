require 'sinatra' 
require 'sequel'
require 'sqlite3'
require './models/post'


get '/' do
    print "Hello world! Add /hello/'your_name' in the URL above"
    erb :welcom, layout: :page_style
end

get '/hello/:name' do
    puts params 
    @name = params[:name]
    @names =["Here you can write posts", "Explore around!", "Keep in mind this site is in progress :)", "Please enter /write_post after 4567 in the url above!"]
    erb :hello, layout: :page_style
end

get '/write_post' do
    erb :write_post, layout: :page_style
end

post '/create_post' do
    new_post = Post.new(params[:title], params[:post_body])
    new_post_row = new_post.create!
  
    redirect "posts/#{new_post_row[:id]}"
  end
   


get '/posts/:post_id' do
    @post = Post.find(params[:post_id])
    erb :post
end
