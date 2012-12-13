class Comment < ActiveRecord::Base
  attr_accessible :text, :ticket_id, :user_id, :user, :state_id

  validates :text, :presence => true

  belongs_to :ticket
  belongs_to :user
  belongs_to :state

  after_create :set_ticket_state

  delegate :project, :to => :ticket

  private
    def set_ticket_state
      self.ticket.state = self.state
      self.ticket.save!
    end
end
