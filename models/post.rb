require 'sequel'
require 'sqlite3'



class Post
    DB = Sequel.connect('sqlite://db/app.db')
    POSTS_TABLE = DB[:posts]
  
    attr_accessor :title, :body, :created_at
  
    def initialize(title, body, created_at = nil)
      @title = title
      @body = body
      @created_at = Time.now
      @created_at = created_at if created_at
    end
    post = Post.new("How To Make a New Post", "Just type: `Post.new('How To Create a New Post', 'Just do this...')``")
    puts post.title

      def create!
        POSTS_TABLE.insert(title: @title, body: @body, created_at: @created_at)
        new_post_row = posts.order(:created_at).last
  
        new_post_row
      end

      def self.find(post_id)
        post_row = POSTS_TABLE.first(id: params[:post_id])
        Post.new(post_row[:title], post_row[:body], post_row[:created_at])
      end

  end