class Station < ActiveRecord::Base
    has_many :lines
    
    belongs_to :assembly_line
end
