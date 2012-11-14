class Contact < ActiveRecord::Base
  attr_accessible :email, :link, :list_id, :name, :phone

  belongs_to :list
end
