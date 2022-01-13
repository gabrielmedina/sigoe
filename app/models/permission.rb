# frozen_string_literal: true

# == Schema Information
#
# Table name: permissions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  entity      :string
#  can_create  :boolean          default("false")
#  can_read    :boolean          default("false")
#  can_update  :boolean          default("false")
#  can_destroy :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  can_manage  :boolean          default("false")
#  can_extras  :boolean          default("false")
#

class Permission < ApplicationRecord
  include SearchCop

  # Validações
  validates :user, presence: true

  belongs_to :user

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes user: 'user.name'
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens de usuários
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [%w[ID id], %w[User user]]
  end
end
