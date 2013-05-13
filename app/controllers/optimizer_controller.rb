class OptimizerController < ApplicationController
  def new
  	@card = Card.new
  end

  def test
    @pwr = [params[:p],params[:p2],params[:p3],params[:p4],params[:p5]]
  	@name = params[:n]
  	@align = params[:an]
    bob = @pwr[0].to_i + @pwr[1].to_i + @pwr[2].to_i + @pwr[3].to_i + @pwr[4].to_i
  	@pwr_tot = bob
  	
    cardlist = []

    if params[:n] != ""
      newcard = {}
      newcard['name'] = params[:n]
      newcard['origin'] = params[:an]
      newcard['pwr'] = params[:p].to_i
      newcard['atk'] = params[:ak].to_i
      newcard['def'] = params[:d].to_i
      temp_effect = params[:a_e]
      temp_what = params[:a_wt]
      temp_who = params[:a_wo]
      temp_adj = params[:a_a]
      temp_usage = params[:u]

      if temp_effect == "1"   #Increase
        if temp_what == "1"   #ATK only
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "No"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "2"    #DEF only
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "3"    #ATK/DEF
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 10.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 20.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 30.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 40.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 50.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        else
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "No"
          newcard['a_pct'] = 0.0
        end
      elsif temp_effect == "2"  #Decrease
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        if temp_what == "2"     #DEF only
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        elsif temp_what == "3"    #ATK/DEF
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        else
          newcard['debuff_all'] = "No"
          newcard['a_pct'] = 0.0
        end
      else
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        newcard['debuff_all'] = "No"
        newcard['a_pct'] = 0.0
      end
      newcard['a_who'] = temp_who
      newcard['a_usage'] = temp_usage
      cardlist.append(newcard)
    end

    if params[:n2] != ""
      newcard = {}
      newcard['name'] = params[:n2]
      newcard['origin'] = params[:an2]
      newcard['pwr'] = params[:p2].to_i
      newcard['atk'] = params[:ak2].to_i
      newcard['def'] = params[:d2].to_i
      temp_effect = params[:a_e2]
      temp_what = params[:a_wt2]
      temp_who = params[:a_wo2]
      temp_adj = params[:a_a2]
      temp_usage = params[:u2]

      if temp_effect == "1"   #Increase
        if temp_what == "1"   #ATK only
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "No"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "2"    #DEF only
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "3"    #ATK/DEF
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 10.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 20.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 30.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 40.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 50.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        else
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "No"
          newcard['a_pct'] = 0.0
        end
      elsif temp_effect == "2"  #Decrease
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        if temp_what == "2"     #DEF only
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        elsif temp_what == "3"    #ATK/DEF
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        else
          newcard['debuff_all'] = "No"
          newcard['a_pct'] = 0.0
        end
      else
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        newcard['debuff_all'] = "No"
        newcard['a_pct'] = 0.0
      end
      newcard['a_who'] = temp_who
      newcard['a_usage'] = temp_usage
      cardlist.append(newcard)
    end

    if params[:n3] != ""
      newcard = {}
      newcard['name'] = params[:n3]
      newcard['origin'] = params[:an3]
      newcard['pwr'] = params[:p3].to_i
      newcard['atk'] = params[:ak3].to_i
      newcard['def'] = params[:d3].to_i
      temp_effect = params[:a_e3]
      temp_what = params[:a_wt3]
      temp_who = params[:a_wo3]
      temp_adj = params[:a_a3]
      temp_usage = params[:u3]

      if temp_effect == "1"   #Increase
        if temp_what == "1"   #ATK only
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "No"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "2"    #DEF only
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "3"    #ATK/DEF
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 10.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 20.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 30.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 40.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 50.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        else
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "No"
          newcard['a_pct'] = 0.0
        end
      elsif temp_effect == "2"  #Decrease
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        if temp_what == "2"     #DEF only
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        elsif temp_what == "3"    #ATK/DEF
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        else
          newcard['debuff_all'] = "No"
          newcard['a_pct'] = 0.0
        end
      else
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        newcard['debuff_all'] = "No"
        newcard['a_pct'] = 0.0
      end
      newcard['a_who'] = temp_who
      newcard['a_usage'] = temp_usage
      cardlist.append(newcard)
    end

    if params[:n4] != ""
      newcard = {}
      newcard['name'] = params[:n4]
      newcard['origin'] = params[:an4]
      newcard['pwr'] = params[:p4].to_i
      newcard['atk'] = params[:ak4].to_i
      newcard['def'] = params[:d4].to_i
      temp_effect = params[:a_e4]
      temp_what = params[:a_wt4]
      temp_who = params[:a_wo4]
      temp_adj = params[:a_a4]
      temp_usage = params[:u4]

      if temp_effect == "1"   #Increase
        if temp_what == "1"   #ATK only
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "No"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "2"    #DEF only
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "3"    #ATK/DEF
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 10.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 20.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 30.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 40.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 50.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        else
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "No"
          newcard['a_pct'] = 0.0
        end
      elsif temp_effect == "2"  #Decrease
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        if temp_what == "2"     #DEF only
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        elsif temp_what == "3"    #ATK/DEF
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        else
          newcard['debuff_all'] = "No"
          newcard['a_pct'] = 0.0
        end
      else
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        newcard['debuff_all'] = "No"
        newcard['a_pct'] = 0.0
      end
      newcard['a_who'] = temp_who
      newcard['a_usage'] = temp_usage
      cardlist.append(newcard)
    end

    if params[:n5] != ""
      newcard = {}
      newcard['name'] = params[:n5]
      newcard['origin'] = params[:an5]
      newcard['pwr'] = params[:p5].to_i
      newcard['atk'] = params[:ak5].to_i
      newcard['def'] = params[:d5].to_i
      temp_effect = params[:a_e5]
      temp_what = params[:a_wt5]
      temp_who = params[:a_wo5]
      temp_adj = params[:a_a5]
      temp_usage = params[:u5]

      if temp_effect == "1"   #Increase
        if temp_what == "1"   #ATK only
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "No"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "2"    #DEF only
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "3"    #ATK/DEF
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 10.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 20.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 30.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 40.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 50.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        else
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "No"
          newcard['a_pct'] = 0.0
        end
      elsif temp_effect == "2"  #Decrease
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        if temp_what == "2"     #DEF only
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        elsif temp_what == "3"    #ATK/DEF
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        else
          newcard['debuff_all'] = "No"
          newcard['a_pct'] = 0.0
        end
      else
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        newcard['debuff_all'] = "No"
        newcard['a_pct'] = 0.0
      end
      newcard['a_who'] = temp_who
      newcard['a_usage'] = temp_usage
      cardlist.append(newcard)
    end

    if params[:n6] != ""
      newcard = {}
      newcard['name'] = params[:n6]
      newcard['origin'] = params[:an6]
      newcard['pwr'] = params[:p6].to_i
      newcard['atk'] = params[:ak6].to_i
      newcard['def'] = params[:d6].to_i
      temp_effect = params[:a_e6]
      temp_what = params[:a_wt6]
      temp_who = params[:a_wo6]
      temp_adj = params[:a_a6]
      temp_usage = params[:u6]

      if temp_effect == "1"   #Increase
        if temp_what == "1"   #ATK only
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "No"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "2"    #DEF only
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "3"    #ATK/DEF
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 10.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 20.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 30.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 40.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 50.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        else
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "No"
          newcard['a_pct'] = 0.0
        end
      elsif temp_effect == "2"  #Decrease
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        if temp_what == "2"     #DEF only
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        elsif temp_what == "3"    #ATK/DEF
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        else
          newcard['debuff_all'] = "No"
          newcard['a_pct'] = 0.0
        end
      else
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        newcard['debuff_all'] = "No"
        newcard['a_pct'] = 0.0
      end
      newcard['a_who'] = temp_who
      newcard['a_usage'] = temp_usage
      cardlist.append(newcard)
    end

    if params[:n7] != ""
      newcard = {}
      newcard['name'] = params[:n7]
      newcard['origin'] = params[:an7]
      newcard['pwr'] = params[:p7].to_i
      newcard['atk'] = params[:ak7].to_i
      newcard['def'] = params[:d7].to_i
      temp_effect = params[:a_e7]
      temp_what = params[:a_wt7]
      temp_who = params[:a_wo7]
      temp_adj = params[:a_a7]
      temp_usage = params[:u7]

      if temp_effect == "1"   #Increase
        if temp_what == "1"   #ATK only
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "No"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "2"    #DEF only
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "3"    #ATK/DEF
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "Yes"
          newcard['debuff_all'] = "No"
          if temp_who == "Self"
            if temp_adj == "1"
              newcard['a_pct'] = 10.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 20.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 30.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 40.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 50.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "1"
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "1"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        else
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "No"
          newcard['a_pct'] = 0.0
        end
      elsif temp_effect == "2"  #Decrease
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        if temp_what == "2"     #DEF only
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 3.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 6.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 9.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 12.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        elsif temp_what == "3"    #ATK/DEF
          if temp_who == "All"
            newcard['debuff_all'] = "Yes"
            if temp_adj == "1"  #Partially
              newcard['a_pct'] = 2.0
            elsif temp_adj == "2"   #Notably
              newcard['a_pct'] = 4.0
            elsif temp_adj == "3"   #Remarkably
              newcard['a_pct'] = 7.0
            elsif temp_adj == "4"   #Significantly
              newcard['a_pct'] = 9.0
            elsif temp_adj == "5"   #Extremely
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            newcard['debuff_all'] = "No"
            newcard['a_pct'] = 0.0
          end
        else
          newcard['debuff_all'] = "No"
          newcard['a_pct'] = 0.0
        end
      else
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        newcard['debuff_all'] = "No"
        newcard['a_pct'] = 0.0
      end
      newcard['a_who'] = temp_who
      newcard['a_usage'] = temp_usage
      cardlist.append(newcard)
    end

    numcards = cardlist.length

    if numcards < 5
      @err = "Less than 5 cards entered correctly.  Did you forget the names?"
      render 'opterror'
      return
    end

    best_atk_cards = []
    best_eff_total = 0
    best_base_atk = 0
    best_adp_bonus = 0
    best_al_bonus = 0
    best_pre_atk = 0
    best_avg_atk = 0

    for a in 0...numcards
      for b in 0...numcards
        for c in 0...numcards
          for d in 0...numcards
            for e in 0...numcards
              #Check to make sure no card is in the deck twice
              if(a == b or a == c or a == d or a == e or b==c or b==d or b==e or c==d or c==e or d==e)
                next
              end
              
              cards = []
              cards = [cardlist[a], cardlist[b], cardlist[c], cardlist[d], cardlist[e]]

              tot_pwr = cards[0]['pwr'] + cards[1]['pwr'] + cards[2]['pwr'] + cards[3]['pwr'] + cards[4]['pwr']
              
              card_atk = [cards[0]['atk'],cards[1]['atk'],cards[2]['atk'],cards[3]['atk'],cards[4]['atk']]
              
              base_atk = card_atk[0] + card_atk[1] + card_atk[2] + card_atk[3] + card_atk[4]

              #Adapter Bonus
              if params[:adp] == "1"
                card_atk[0] = (card_atk[0] * 1.05).round
                
                card_atk[1] = (card_atk[1] * 1.05).round
                if(cards[1]['origin'] == cards[0]['origin'])
                  card_atk[1] = card_atk[1] + (cards[0]['atk'] * 0.05).round
                end
                
                card_atk[2] = (card_atk[2] * 1.05).round
                if(cards[2]['origin'] == cards[0]['origin'])
                  card_atk[2] = card_atk[2] + (cards[0]['atk'] * 0.05).round
                end
                if(cards[2]['origin'] == cards[1]['origin'])
                  card_atk[2] = card_atk[2] + (cards[1]['atk'] * 0.05).round
                end
                
                card_atk[3] = (card_atk[3] * 1.05).round
                if(cards[3]['origin'] == cards[0]['origin'])
                  card_atk[3] = card_atk[3] + (cards[0]['atk'] * 0.05).round
                end
                if(cards[3]['origin'] == cards[1]['origin'])
                  card_atk[3] = card_atk[3] + (cards[1]['atk'] * 0.05).round
                end
                if(cards[3]['origin'] == cards[2]['origin'])
                  card_atk[3] = card_atk[3] + (cards[2]['atk'] * 0.05).round
                end
                
                card_atk[4] = (card_atk[4] * 1.05).round
                if(cards[4]['origin'] == cards[0]['origin'])
                  card_atk[4] = card_atk[4] + (cards[0]['atk'] * 0.05).round
                end
                if(cards[4]['origin'] == cards[1]['origin'])
                  card_atk[4] = card_atk[4] + (cards[1]['atk'] * 0.05).round
                end
                if(cards[4]['origin'] == cards[2]['origin'])
                  card_atk[4] = card_atk[4] + (cards[2]['atk'] * 0.05).round
                end
                if(cards[4]['origin'] == cards[3]['origin'])
                  card_atk[4] = card_atk[4] + (cards[3]['atk'] * 0.05).round
                end
              end

              post_adp_atk = card_atk[0] + card_atk[1] + card_atk[2] + card_atk[3] + card_atk[4]

              temp_adp_bonus = post_adp_atk - base_atk

              #Alliance Position
              if params[:al] == "1" or params[:al] == "3"
                al_mult = 1.10
              elsif params[:al] == "2"
                al_mult = 1.05
              else
                al_mult = 1
              end

              card_atk[0] = (card_atk[0] * al_mult).round
              card_atk[1] = (card_atk[1] * al_mult).round
              card_atk[2] = (card_atk[2] * al_mult).round
              card_atk[3] = (card_atk[3] * al_mult).round
              card_atk[4] = (card_atk[4] * al_mult).round

              post_al_atk =  card_atk[0] + card_atk[1] + card_atk[2] + card_atk[3] + card_atk[4]

              temp_al_bonus = post_al_atk - post_adp_atk

              #Scrapper Bonus
              if params[:sc] == "1"
                sc_mult = 1.10
              elsif params[:sc] == "2"
                sc_mult = 1.21
              elsif params[:sc] == "3"
                sc_mult = 1.30
              else
                sc_mult = 1
              end

              card_atk[0] = (card_atk[0] * sc_mult).round
              card_atk[1] = (card_atk[1] * sc_mult).round
              card_atk[2] = (card_atk[2] * sc_mult).round
              card_atk[3] = (card_atk[3] * sc_mult).round
              card_atk[4] = (card_atk[4] * sc_mult).round
              
              pre_proc_atk = card_atk[0] + card_atk[1] + card_atk[2] + card_atk[3] + card_atk[4]

              temp_sc_bonus = pre_proc_atk - post_al_atk
              
              pre_proc_atks = [card_atk[0],card_atk[1],card_atk[2],card_atk[3],card_atk[4]]
              
              avg_atk2 = [card_atk[0],card_atk[1],card_atk[2],card_atk[3],card_atk[4]]
              
              #Avg_atk experiment
              if cards[0]['boost_atk'] == 'Yes'
                if cards[0]['a_usage'] == '3'
                  multiplier = 0.55
                elsif cards[0]['a_usage'] == '4'
                  multiplier = 0.68
                elsif cards[0]['a_usage'] == '5'
                  multiplier = 0.75
                else
                  multiplier = 0.35
                end
                if cards[0]['a_who'] == 'Speeds'
                  for j in 0...5
                    if cards[j]['origin'] == 'SPD'
                      avg_atk2[j] = avg_atk2[j] * (1 + multiplier*(cards[0]['a_pct']/100))
                    end
                  end
                end
                if cards[0]['a_who'] == 'Bruisers'
                  for j in 0...5
                    if cards[j]['origin'] == 'BRU'
                      avg_atk2[j] = avg_atk2[j] * (1 + multiplier*(cards[0]['a_pct']/100))
                    end
                  end
                end
                if cards[0]['a_who'] == 'Tactics'
                  for j in 0...5
                    if cards[j]['origin'] == 'TAC'
                      avg_atk2[j] = avg_atk2[j] * (1 + multiplier*(cards[0]['a_pct']/100))
                    end
                  end
                end
                if cards[0]['a_who'] == 'All'
                  for j in 0...5
                    avg_atk2[j] = avg_atk2[j] * (1 + multiplier*(cards[0]['a_pct']/100))
                  end
                end
                if cards[0]['a_who'] == 'Self'
                  avg_atk2[0] = avg_atk2[0] * (1 + multiplier*(cards[0]['a_pct']/100))
                end
              end
                  
              for i in 1...5
                if cards[i]['boost_atk'] == 'Yes'
                  if cards[i]['a_usage'] == '3'
                    multiplier = 0.50
                  elsif cards[i]['a_usage'] == '4'
                    multiplier = 0.66
                  elsif cards[i]['a_usage'] == '5'
                    multiplier = 0.75
                  else
                    multiplier = 0.33
                  end
                  if cards[i]['a_who'] == 'Speeds'
                    for j in 0...5
                      if cards[j]['origin'] == 'SPD'
                        avg_atk2[j] = avg_atk2[j] * (1 + multiplier*(cards[i]['a_pct']/100))
                      end
                    end
                  end
                  if cards[i]['a_who'] == 'Bruisers'
                    for j in 0...5
                      if cards[j]['origin'] == 'BRU'
                        avg_atk2[j] = avg_atk2[j] * (1 + multiplier*(cards[i]['a_pct']/100))
                      end
                    end
                  end
                  if cards[i]['a_who'] == 'Tactics'
                    for j in 0...5
                      if cards[j]['origin'] == 'TAC'
                        avg_atk2[j] = avg_atk2[j] * (1 + multiplier*(cards[i]['a_pct']/100))
                      end
                    end
                  end
                  if cards[i]['a_who'] == 'All'
                    for j in 0...5
                      avg_atk2[j] = avg_atk2[j] * (1 + multiplier*(cards[i]['a_pct']/100))
                    end
                  end
                  if cards[i]['a_who'] == 'Self'
                    avg_atk2[i] = avg_atk2[i] * (1 + multiplier*(cards[i]['a_pct']/100))
                  end
                end
              end
                    
              avg_atk2_total = avg_atk2[0] + avg_atk2[1] + avg_atk2[2] + avg_atk2[3] + avg_atk2[4]

              post_debuff_total = avg_atk2_total.round

              #Debuffs
              for i in 0...5
                if cards[i]['debuff_all'] == "Yes"
                  if i == 0
                    if cards[i]['a_usage'] == '3'
                      multiplier = 0.55
                    elsif cards[i]['a_usage'] == '4'
                      multiplier = 0.68
                    elsif cards[i]['a_usage'] == '5'
                      multiplier = 0.75
                    else
                      multiplier = 0.33
                    end
                  else
                    if cards[i]['a_usage'] == '3'
                      multiplier = 0.50
                    elsif cards[i]['a_usage'] == '4'
                      multiplier = 0.66
                    elsif cards[i]['a_usage'] == '5'
                      multiplier = 0.75
                    else
                      multiplier = 0.33
                    end
                  end
                  eff_boost = (1.0 / (1.0 - (cards[i]['a_pct']/100))) - 1
                  eff_boost = 1 + (multiplier * eff_boost)
                  post_debuff_total = (post_debuff_total * eff_boost).round
                end
              end
              
              #Special Combos
                #Nothing yet
              
              if post_debuff_total > best_eff_total
                best_eff_total = post_debuff_total
                best_base_atk = base_atk
                best_adp_bonus = temp_adp_bonus
                best_al_bonus = temp_al_bonus
                best_sc_bonus = temp_sc_bonus
                best_pre_atk = pre_proc_atk
                best_avg_atk = avg_atk2_total.round
                best_atk_cards[0] = cards[0]
                best_atk_cards[1] = cards[1]
                best_atk_cards[2] = cards[2]
                best_atk_cards[3] = cards[3]
                best_atk_cards[4] = cards[4]
              end
            end
          end
        end
      end
    end

    if best_base_atk == 0
      @err = "No best deck was found.  Did you forget an ATK field?"
      render 'opterror'
      return
    end

    @num = numcards

    @base = best_base_atk
    @adp = best_adp_bonus
    @al = best_al_bonus
    @sc = best_sc_bonus
    @pre = best_pre_atk
    @avg = best_avg_atk
    @eff = best_eff_total

    @best1 = best_atk_cards[0]
    @best2 = best_atk_cards[1]
    @best3 = best_atk_cards[2]
    @best4 = best_atk_cards[3]
    @best5 = best_atk_cards[4]


    render 'result'

  end
end
