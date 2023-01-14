class Picture
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
    
    attr_reader :params
    attr_accessor :original_filename, :name, :city, :timestamp
   
    validates_presence_of :original_filename, :city, :timestamp
    validates :city, :name, presence: true, length: { minimum: 1, maximum: 20 }
    validates_format_of :original_filename, :with => /\w+(\.\w+)\z/i
    validates_format_of :city, :with => /\A[A-Z][a-z]+\z/s
    validates_with CityValidator
    
    def initialize(attributes = {})
        attributes.each do |name, value|
          send("#{name}=", value)
        end
    end

    def initialize(params)
        # puts params 
        filename, city, timestamp = params[:line_text].split.join.split(',')
        self.city = city
        self.timestamp = timestamp
        self.original_filename = filename
    end

    def set_name(pictures_count)
        digits = pictures_count.to_s.size
        ext = self.original_filename.split('.').last
        self.name = "#{self.city}#{pictures_count.to_s.rjust(digits, '0')}.#{ext}"
    end
    
    def persisted?
        false
    end
  end