module CityStateHelper
    def self.city_exists?(city_name)
        CS.countries.keys.each do |country|
            CS.states(country).keys.each do |state|
                return true if CS.cities(state, country).include?(city_name)
            end
        end
        return false
    end
end
