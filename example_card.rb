class Card
  attr_accessor :name, :align, :pwr, :attack, :defense, :gender, :faction, :abil_lvl, :abil_usage, :abil_adj, :abil_who, :abil_what, :abil_type

  def initialize(attributes = {})
    @name  = attributes[:name]
    @align = attributes[:align]
    @pwr = attributes[:pwr]
    @attack = attributes[:attack]
    @defense = attributes[:defense]
    @gender = attributes[:gender]
    @faction = attributes[:faction]
    @abil_lvl = attributes[:abil_lvl]
    @abil_usage = attributes[:abil_usage]
    @abil_adj = attributes[:abil_adj]
    @abil_who = attributes[:abil_who]
    @abil_what = attributes[:abil_what]
    @abil_type = attributes[:abil_type]
  end
end