module ApplicationHelper
  def activate_account
    self.update_attribute(:click, true)
  end
end
