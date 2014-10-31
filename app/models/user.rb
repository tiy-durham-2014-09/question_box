class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_and_belongs_to_many :tags

  has_many :comments
  has_many :votes

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[\w\-\.]+@[\w\-\.]+\Z/, message: "must be a valid email address" }

  validates :name, presence: true

  validates :score,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_secure_password

  def self.tagged_with(name)
    Tag.find_by!(name: name).users
  end

  def self.tag_counts
    Tag.select("tags.*, count(questions_tags.tag_id) as count").
        joins(:questions).group("tags.id").order("count(questions_tags.tag_id) DESC")
  end

  def tag_names
    tags.map(&:name)
  end

  def tag_list
    tag_names.join(", ")
  end

  # def tag_list=(names)
  #   self.tags = names.split(",").map do |n|
  #     Tag.where(name: n.strip.downcase).first_or_create!
  #   end
  # end
end
