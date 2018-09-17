class BlogSearch
	include ActionView::Helpers::SanitizeHelper
	include ActiveModel::Model

	attr_accessor :contents

	def search
		Post.left_joins(:tags).joins(:blog).where("lower(blogs.title) like ? or lower(posts.title) like ? or lower(posts.body) like ? or lower(tags.name) like ?", "%#{contents.downcase}%", "%#{contents.downcase}%", "%#{contents.downcase}%", "%#{contents.downcase}%").uniq
	end
end