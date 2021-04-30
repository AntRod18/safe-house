module PostsHelper
    def show_post
        current_user.posts.each do |f|
            f.game_name
        end
    end

    def all_posts
        @post.collect do |t|
            content_tag(:li, t.content)
        end
    end
end