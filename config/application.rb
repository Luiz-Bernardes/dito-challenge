require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


listener = Listen.to('files') do |modified, added, removed| 

  puts "added absolute path: #{added}"
  puts "removed absolute path: #{removed}"
  puts "modified absolute path: #{modified}"
  
  if !added.empty?
    file_path = added 
  elsif !modified.empty?
    file_path = modified
  else;end 

  if !added.empty? || !modified.empty?
    added_file = file_path[0].split("/")
    arquivo_csv = File.open('files/' + added_file[-1] , 'rb') { |file| file.read }
    arquivo_csv_encode = arquivo_csv.encode(Encoding.find('UTF-8'), { invalid: :replace, undef: :replace, replace: ''} )
    lines = arquivo_csv_encode.split("\n")
    
    size = lines.length
    (0..size - 1).each do |line|
      fields = lines[line].split(";")
      
      existing_user = User.find_by(code: fields[2])
      user = existing_user.present? ? existing_user : (User.create name: fields[1], code: fields[2])
      Point.create score_date: fields[0], score: fields[3], user_id: user.id
    end
  end
  
end
listener.start # not blocking


module Challenge
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = 'Brasilia'
    config.i18n.default_locale = :'pt-BR'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
