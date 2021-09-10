class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    # def favorite_product
    #     self.reviews.sort_by {|review| review.star_rating}.first
    # end

    # def favorite_product
    #     product.where("star_rating=?", self.highest_rating).first
    # end

        

    def remove_reviews(product)
       review = self.reviews.find_by_product_id(product.id)
       if review
            review.destroy
       end
    end

    
end