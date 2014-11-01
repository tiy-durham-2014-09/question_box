class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_and_belongs_to_many :tags
  has_many :votes, as: :voteable


  validates :title, presence: true
  validates :text, presence: true
  validates :user, presence: true

  scope :answered, -> { where("EXISTS (SELECT null FROM answers where answers.question_id = questions.id)") }
  scope :unanswered, -> { where("NOT EXISTS (SELECT null FROM answers where answers.question_id = questions.id)") }
  scope :recently_answered, -> do
    select("questions.*, MAX(answers.created_at) AS answered_at").
    joins("INNER JOIN answers ON answers.question_id = questions.id").
    group("questions.id").
    order("answered_at DESC")
  end

  def answered?
    answers.count > 0
  end

  def unanswered?
    !answered?
  end

  def has_chosen_answer?
    answers.where(chosen: true).count > 0
  end

  def score
    votes.sum(:value)
  end

  def self.tagged_with(name)
<<<<<<< HEAD
      Tag.find_by!(name: name).questions
=======
    begin
      Tag.find_by!(name: name).questions
    rescue Exception => e
      []
    end
>>>>>>> 900116fd8cace9d5ae4b763c91935164747c0588
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

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      # FIXME strip out non-permitted characters at this point? elsewhere?
      # TODO Stack Overflow says must be shorter than 25 characters; must use the character set a-z 0-9 + # - .
      # TODO Make sure these tags are findable by downcasing searches as well
      Tag.where(name: n.truncate(255).strip.downcase).first_or_create!
    end
  end
end
