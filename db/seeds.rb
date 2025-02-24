admin_password = ENV.fetch("ADMIN_PASSWORD", "muhehe128")
admin = User.find_or_create_by!(email: "sulcino@gmail.com") do |user|
  user.password = admin_password
  user.password_confirmation = admin_password
end
admin.add_role(:admin) unless admin.has_role?(:admin)
