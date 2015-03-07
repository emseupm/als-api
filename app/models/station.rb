class Station < ActiveRecord::Base
    has_many :line
    
    belongs_to :assembly_line
end
