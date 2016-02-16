class RiskInformation < ActiveRecord::Base
  include UpdateEscortOnSave

  has_paper_trail
  belongs_to :escort
end
