class Post < ActiveRecord::Base
    validates :title, presence: true #checking if there is a title 
    validates :content, length: { minimum: 250 } #checking how short the piece of content is. so is content >= 250 ?
    validates :summary, length: { maximum: 250 } #checking how long the summary is. again so is content <= 250?
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) } #checking if your post has a category there are only two category its checking for
    validate :is_this_dumb_enough? #costom VALLY 

     #MUST_INCLUDE_IN_TITLE_PATTERNS = [ "Won't Believe" , "Secret", "Top [0-99]", "Guess" ] 
     MUST_INCLUDE_IN_TITLE_PATTERNS = [ /Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i] #these are the patterns that I want in my title

    def is_this_dumb_enough?
        if MUST_INCLUDE_IN_TITLE_PATTERNS.none? { |x| x.match title }
        errors.add(:title, "we need the views be a scumbag and clickbate the hell out of people")
        end
     end 
   end

   #this method is checking if the title has one of the specified pieces of garbage in "MUST_INCLUDE_IN_TITLE_PATTERNS"
   #if it doesent throw that error 
