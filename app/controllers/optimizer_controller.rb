class OptimizerController < ApplicationController
  def new
  	@card = Card.new
  end

  def test
    @pwr = [params[:pwr],params[:pwr2],params[:pwr3],params[:pwr4],params[:pwr5]]
  	@name = params[:name]
  	@align = params[:align]
    bob = @pwr[0].to_i + @pwr[1].to_i + @pwr[2].to_i + @pwr[3].to_i + @pwr[4].to_i
  	@pwr_tot = bob
  	
    cardlist = []

    if params[:name] != ""
      newcard = {}
      newcard['name'] = params[:name]
      newcard['origin'] = params[:align]
      newcard['pwr'] = params[:pwr].to_i
      newcard['atk'] = params[:attack].to_i
      newcard['def'] = params[:defense].to_i
      temp_effect = params[:abil_effect]
      temp_what = params[:abil_what]
      temp_who = params[:abil_who]
      temp_adj = params[:abil_adj]
      temp_usage = params[:usage]

      if temp_effect == "Increase"
        if temp_what == "ATK"
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "No"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "DEF"
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "Yes"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "ATK/DEF"
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "Yes"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 10.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 20.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 30.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 40.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 50.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 2.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 7.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
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
      else
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        newcard['a_pct'] = 0.0
      end
      newcard['a_who'] = temp_who
      newcard['a_usage'] = temp_usage
      cardlist.append(newcard)
    end

    if params[:name2] != ""
      newcard = {}
      newcard['name'] = params[:name2]
      newcard['origin'] = params[:align2]
      newcard['pwr'] = params[:pwr2].to_i
      newcard['atk'] = params[:attack2].to_i
      newcard['def'] = params[:defense2].to_i
      temp_effect = params[:abil_effect2]
      temp_what = params[:abil_what2]
      temp_who = params[:abil_who2]
      temp_adj = params[:abil_adj2]
      temp_usage = params[:usage2]

      if temp_effect == "Increase"
        if temp_what == "ATK"
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "No"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "DEF"
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "Yes"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "ATK/DEF"
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "Yes"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 10.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 20.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 30.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 40.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 50.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 2.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 7.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
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
      else
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        newcard['a_pct'] = 0.0
      end
      newcard['a_who'] = temp_who
      newcard['a_usage'] = temp_usage
      cardlist.append(newcard)
    end

    if params[:name3] != ""
      newcard = {}
      newcard['name'] = params[:name3]
      newcard['origin'] = params[:align3]
      newcard['pwr'] = params[:pwr3].to_i
      newcard['atk'] = params[:attack3].to_i
      newcard['def'] = params[:defense3].to_i
      temp_effect = params[:abil_effect3]
      temp_what = params[:abil_what3]
      temp_who = params[:abil_who3]
      temp_adj = params[:abil_adj3]
      temp_usage = params[:usage3]

      if temp_effect == "Increase"
        if temp_what == "ATK"
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "No"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "DEF"
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "Yes"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "ATK/DEF"
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "Yes"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 10.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 20.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 30.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 40.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 50.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 2.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 7.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
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
      else
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        newcard['a_pct'] = 0.0
      end
      newcard['a_who'] = temp_who
      newcard['a_usage'] = temp_usage
      cardlist.append(newcard)
    end

    if params[:name4] != ""
      newcard = {}
      newcard['name'] = params[:name4]
      newcard['origin'] = params[:align4]
      newcard['pwr'] = params[:pwr4].to_i
      newcard['atk'] = params[:attack4].to_i
      newcard['def'] = params[:defense4].to_i
      temp_effect = params[:abil_effect4]
      temp_what = params[:abil_what4]
      temp_who = params[:abil_who4]
      temp_adj = params[:abil_adj4]
      temp_usage = params[:usage4]

      if temp_effect == "Increase"
        if temp_what == "ATK"
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "No"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "DEF"
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "Yes"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "ATK/DEF"
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "Yes"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 10.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 20.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 30.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 40.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 50.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 2.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 7.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
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
      else
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
        newcard['a_pct'] = 0.0
      end
      newcard['a_who'] = temp_who
      newcard['a_usage'] = temp_usage
      cardlist.append(newcard)
    end

    if params[:name5] != ""
      newcard = {}
      newcard['name'] = params[:name5]
      newcard['origin'] = params[:align5]
      newcard['pwr'] = params[:pwr5].to_i
      newcard['atk'] = params[:attack5].to_i
      newcard['def'] = params[:defense5].to_i
      temp_effect = params[:abil_effect5]
      temp_what = params[:abil_what5]
      temp_who = params[:abil_who5]
      temp_adj = params[:abil_adj5]
      temp_usage = params[:usage5]

      if temp_effect == "Increase"
        if temp_what == "ATK"
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "No"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "DEF"
          newcard['boost_atk'] = "No"
          newcard['boost_def'] = "Yes"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 24.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 36.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 48.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 60.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 16.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 8.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 16.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 20.0
            else
              newcard['a_pct'] = 0.0
            end
          end
        elsif temp_what == "ATK/DEF"
          newcard['boost_atk'] = "Yes"
          newcard['boost_def'] = "Yes"
          if temp_who == "Self"
            if temp_adj == "Partially"
              newcard['a_pct'] = 10.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 20.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 30.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 40.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 50.0
            else
              newcard['a_pct'] = 0.0
            end
          elsif temp_who == "All"
            if temp_adj == "Partially"
              newcard['a_pct'] = 2.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 4.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 7.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Extremely"
              newcard['a_pct'] = 12.0
            else
              newcard['a_pct'] = 0.0
            end
          else
            if temp_adj == "Partially"
              newcard['a_pct'] = 3.0
            elsif temp_adj == "Notably"
              newcard['a_pct'] = 6.0
            elsif temp_adj == "Remarkably"
              newcard['a_pct'] = 9.0
            elsif temp_adj == "Significantly"
              newcard['a_pct'] = 12.0
            elsif temp_adj == "Extremely"
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
      else
        newcard['boost_atk'] = "No"
        newcard['boost_def'] = "No"
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
    best_base_atk = 0
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
              
              pre_proc_atk = card_atk[0] + card_atk[1] + card_atk[2] + card_atk[3] + card_atk[4]
              
              pre_proc_atks = [card_atk[0],card_atk[1],card_atk[2],card_atk[3],card_atk[4]]
              
              avg_atk2 = [card_atk[0],card_atk[1],card_atk[2],card_atk[3],card_atk[4]]
              
              #Avg_atk experiment
              if cards[0]['boost_atk'] == 'Yes'
                if cards[0]['a_usage'] == 'Average'
                  multiplier = 0.55
                elsif cards[0]['a_usage'] == 'Relatively High'
                  multiplier = 0.68
                elsif cards[0]['a_usage'] == 'High'
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
                  if cards[i]['a_usage'] == 'Average'
                    multiplier = 0.50
                  elsif cards[i]['a_usage'] == 'Relatively High'
                    multiplier = 0.66
                  elsif cards[i]['a_usage'] == 'High'
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
              
              #Special Combos
                #Nothing yet
              
              if avg_atk2_total > best_avg_atk
                best_base_atk = base_atk
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

    @base = best_base_atk
    @pre = best_pre_atk
    @avg = best_avg_atk

    @best1 = best_atk_cards[0]
    @best2 = best_atk_cards[1]
    @best3 = best_atk_cards[2]
    @best4 = best_atk_cards[3]
    @best5 = best_atk_cards[4]


    render 'result'

  end
end
