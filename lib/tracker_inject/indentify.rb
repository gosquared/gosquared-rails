
def validate_properties(current_user)
  unless GosquaredRails.configure.custom_properties.key?(:id) || GosquaredRails.configure.custom_properties.key(:email)
  STDERR.puts "ERROR: GoSquared User properties must include id or email address"
end
end


def sort_property_fields(hash)
  property_fields = ['id', 'email', 'name', 'first_name', 'last_name',
    'username', 'phone', 'created_at']

    @standard_properties_hash = {}
    @custom_properties_hash = {}
    hash.each do | key, value |
      property_fields.each do | property |
       if key.to_s === property
        @standard_properties_hash[key] = value
        hash.except!(key)
      end
      @custom_properties_hash = hash
    end
  end
end

def gosquared_custom_properties
  @custom_properties = "custom: { \n "
  @custom_properties_hash.each do |key, value|
   @custom_properties  << "#{key}: '#{value}',\n "
 end
 @custom_properties << '}'
end

def gosquared_standard_properties
  @standard_properties=  " { \n "
  @standard_properties_hash.each do |key, value|
   @standard_properties  << "#{key}: '#{value}',\n "
 end
 @standard_properties << '}' if @custom_properties == "custom: { \n }"
 @standard_properties
end

