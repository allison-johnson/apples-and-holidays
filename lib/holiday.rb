require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each do |holiday, supply_arr|
    supply_arr << supply
  end #each
end

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply 
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  all_supplies = []
  holiday_hash[:winter].each do |holiday, supply_arr|
    all_supplies.concat(supply_arr)
  end #each
  all_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, hash_for_that_season|
    puts season.to_s.capitalize + ":"

    hash_for_that_season.each do |holiday_name, supplies_for_holiday|
      holiday_name = holiday_name.to_s 
      holiday_name_arr = holiday_name.split("_")
      holiday_name_final = ""
      holiday_name_arr.each_with_index do |word, index|
        holiday_name_final = holiday_name_final + word.capitalize
        if index < holiday_name_arr.length - 1
          holiday_name_final = holiday_name_final + " "
        end #if
      end #each
      holiday_string = "  " + holiday_name_final + ": "

      supplies_for_holiday.each_with_index do |supply, index|
        holiday_string = holiday_string + supply
        if index < supplies_for_holiday.length - 1
          holiday_string = holiday_string + ", "
        end #if
      end
      #binding.pry
      puts holiday_string
    end #each
  end #each
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidays_with_bbq = []
  holiday_hash.each do |season, holiday_info|
    holiday_info.each do |holiday, supplies|
      if supplies.include?("BBQ")
        holidays_with_bbq << holiday
      end #if
    end #inner each
  end #each
  holidays_with_bbq 
end


  # holiday_hash = 
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }

  # all_supplies_in_holidays(holiday_hash)




