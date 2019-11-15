class Author < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true #checking if name if there and checking if name is uniq. idk why we weould check that plenty of mike's
    validates :phone_number, length: {is: 10 } #checking if the phone number is EXACTLY 10

end
