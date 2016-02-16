class Prisoner < ActiveRecord::Base
  include UpdateEscortOnSave

  has_paper_trail
  belongs_to :escort

  def full_name
    [family_name, forenames].join(', ')
  end

  def formatted_date_of_birth
    date_of_birth&.strftime('%d/%m/%Y')
  end
end
