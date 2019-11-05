# frozen_string_literal: true

namespace :yarn do
  desc 'Compile Yarn'
  task compile: :environment do
    sh './bin/yarn install'
  end
end
