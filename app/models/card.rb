class Card < ActiveRecord::Base
  attr_accessible :abil_adj, :abil_lvl, :abil_type, :abil_what, :abil_who, :align, :attack, :defense, :faction, :gender, :name, :pwr, :usage

  validates :name, presence: true, uniqueness: true
  validates :pwr, presence: true
  validates :gender, presence: true
  validates :faction, presence: true
  validates :usage, presence: true
  validates :abil_adj, presence: true
  validates :abil_who, presence: true
  validates :abil_what, presence: true
  validates :abil_type, presence: true
end
