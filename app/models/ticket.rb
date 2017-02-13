class Ticket < ActiveRecord::Base
  belongs_to :payment
end
