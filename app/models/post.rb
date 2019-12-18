class Post < ApplicationRecord
	attachment :image
	belongs_to :user
	has_many :post_hashtags, dependent: :destroy
	has_many :hashtags, through: :post_hashtags

	after_create do
		post = Post.find_by(id: self.id)
		hashtags  = self.body.scan(/[#][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
		hashtags.uniq.map do |hashtag|
			tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
			# post.hashtags << tag
			PostHashtag.create!(post_id: self.id, hashtag_id: tag.id)
		end
	end

	before_update do
		post = Post.find_by(id: self.id)
		post.hashtags.clear
		hashtags  = self.body.scan(/[#][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
		hashtags.uniq.map do |hashtag|
			tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
			# post.hashtags << tag
			PostHashtag.create!(post_id: self.id, hashtag_id: tag.id)
		end
	end
end
