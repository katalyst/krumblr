class PagesController < ApplicationController
	def index
		@posts = Post.all.order("updated_at DESC").page(params[:page]).per(5)
	end

	def post_show
		@post = Post.find_by(id: params[:id])

		unless @post.present?
			flash[:error] = "Post does not exist"
			redirect_to root_path
		end
	end

	def blog_show
		@blog = Blog.find_by(id: params[:id])
		@posts = @blog.posts.order("updated_at DESC").page(params[:page]).per(5) if @blog.present?

		unless @blog.present?
			flash[:error] = "Blog does not exist"
			redirect_to root_path
		end
	end

	def blog_search
		@blog_search = BlogSearch.new(blog_search_params)
		@posts = Kaminari.paginate_array(@blog_search.search.sort_by! {|post| post.updated_at  unless post.blank?}.reverse).page(params[:page]).per(5)
	end

	private
		def blog_search_params
			params.require(:blog_search).permit(:contents)
		end
end
