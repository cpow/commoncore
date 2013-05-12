class PolymorphicObjectBuilder
  attr_accessor :params, :method

  def initialize(params, method)
    @method = method
    @params = params
  end

  def find_polymorphic_object
    @params.each do |name, value|
      if !(name =~ /user/) and name =~ /(.+)_id$/
        polymorphic_object = $1.classify.constantize.find(value)
        return polymorphic_object if polymorphic_object.respond_to?(method.to_sym)
      end
    end
    nil
  end
end
