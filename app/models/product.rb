class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, presence: true

  def self.search(search_term)
    Product.where("name LIKE ?", "%#{search_term}%")
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_desc.last
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def test
    @bla = "test"
  end

  def img_reader(img_str)
    @img_array = []
    # puts img_str
    counter = img_str.scan("#$#").count
    counter.times do
      img_pos_start = img_str.index("#$#") + 3
      img_str_length = img_str.length
      img_str = img_str[img_pos_start,img_str_length]
      img_pos_end = img_str.index("#$#")
      if img_pos_end == nil
        img_pos_end = img_str.length
      end
      img_pos_end -= 2
      img_single = img_str[0,img_pos_end]
      puts img_single
      @img_array.push(img_single)
    end
  end

end
