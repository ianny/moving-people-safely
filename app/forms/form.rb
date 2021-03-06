class Form
  include Virtus.model
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include DateHandling

  extend ActiveModel::Translation

  attr_accessor :model

  def initialize(model)
    @model = model
    load_model_data
  end

  def assign_attributes(params)
    params.each do |key, value|
      public_send("#{key}=", value)
    end
  end

  def save
    if valid?
      target.update_attributes(attributes)
      true
    else
      false
    end
  end

  def name
    self.class.name.downcase
  end
  alias_method :template, :name

  def url
    Rails.application.routes.url_helpers.
      send("#{name}_path", model)
  end

  def target
    model
  end

private

  def load_model_data
    attributes.each_key do |key|
      public_send("#{key}=", target.send(key))
    end
  end
end
