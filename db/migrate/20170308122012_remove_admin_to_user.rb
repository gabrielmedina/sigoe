# frozen_string_literal: true

class RemoveAdminToUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :admin, :boolean
  end
end
