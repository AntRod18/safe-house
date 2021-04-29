module PostsHelper
    def show_posts
        current_user.post.each do |p|
            p.game
        end
    end
end