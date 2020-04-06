class AddReferencesToQuestionnaire < ActiveRecord::Migration[5.1]
  def change
    add_reference :questionnaires, :user, foreign_key: true
  end
end
