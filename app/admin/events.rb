ActiveAdmin.register Event do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :title, :members, :description

  index do
    column :id
    column :title
    column :description
    column :deadline
    column :members
    column :price_limit
    column 'Member since' do |event|
      time_ago_in_words(event.created_at)
    end
    actions
  end

  filter :title
end
