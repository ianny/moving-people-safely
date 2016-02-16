module UpdateEscortOnSave
  extend ActiveSupport::Concern

  included do
    before_save -> { escort.touch }
  end
end
