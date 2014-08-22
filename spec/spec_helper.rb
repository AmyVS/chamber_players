require 'bundler/setup'
Bundler.require(:default, :test)

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

RSpec.configure do |config|
  config.after(:each) do
    Piece.all.each { |piece| piece.destroy }
    Musician.all.each { |musician| musician.destroy }
    Part.all.each { |part| part.destroy }
    Role.all.each { |role| role.destroy }
  end
end
