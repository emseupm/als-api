class AssemblyLine < ActiveRecord::Base
    has_many :stations, :dependent => :destroy
end
