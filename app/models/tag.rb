class Tag < ActiveRecord::Base
  belongs_to :question

  #	has a name

  #	has and belongs to many questions

end
