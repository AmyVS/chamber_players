require 'bundler/setup'
Bundler.require(:default, :test)
I18n.enforce_available_locales = false

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do |config|
  config.after(:each) do
    Piece.all.each { |piece| piece.destroy }
    Composer.all.each { |composer| composer.destroy }
    Musician.all.each { |musician| musician.destroy }
    Instrument.all.each { |instrument| instrument.destroy }
    Part.all.each { |part| part.destroy }
  end
end
