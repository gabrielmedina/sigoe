# frozen_string_literal: true

class AddEnrollmentToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :enrollment, :string
  end
end
