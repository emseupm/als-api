class AssemblyLine < ActiveRecord::Base
    has_many :stations, dependent: :destroy
    has_many :simulations, dependent: :destroy

    accepts_nested_attributes_for :stations, allow_destroy: true
end
