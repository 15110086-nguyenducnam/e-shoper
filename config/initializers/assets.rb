# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
 Rails.application.config.assets.precompile += %w( bootstrap.min.js animate.css bootstrap.min.css main.css prettyPhoto.css price-range.css responsive.css style2.css )
 Rails.application.config.assets.precompile += %w( font-awesome.min jquery.js flyto.js)
 # Rails.application.config.assets.precompile += %w( style2.css )
# Rails.application.config.assets.precompile += %w( bootstrap.min.css )
# Rails.application.config.assets.precompile += %w( bootstrap.min.js )
