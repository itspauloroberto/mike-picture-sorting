class CityValidator < ActiveModel::Validator
    def validate(record)
        record.errors.add(:city, "provided city name seems to not exist.") unless CityStateHelper.city_exists?(record.city)
    end
end