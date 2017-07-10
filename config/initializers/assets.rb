# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

 Rails.application.config.assets.precompile += ['active_admin.scss']
 Rails.application.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.svg)
 Rails.application.config.assets.precompile += ['responsive.scss']
 Rails.application.config.assets.precompile += ['bootstrap.min.scss']
 Rails.application.config.assets.precompile += ['Uvjeti_upotrebe_usluge_MaaS360_uskladjeno _s_odvjetnikom_clean.docx']