module List
    class CreateService
      attr_reader :input
  
      def initialize(input)
        @input = input
        @pictures = []
      end
  
      def call
        return nil if input.nil?
        
        build_list

        return @pictures.map(&:name)
      end
  
      private
  
      def build_list
        input.split("\n").each do |line|
            picture = Picture.new(:line_text => line )
            
            # require 'pry'; binding.pry
            
            return if picture.nil?

            actual_count = instance_variable_get("@city_#{picture.city}")
            instance_variable_set("@city_#{picture.city}", actual_count ? (actual_count + 1) : 1)

            picture.set_name(instance_variable_get("@city_#{picture.city}"))
            @pictures.append(picture) if picture.valid?
        end
      end
  
    end
  end