ActiveAdmin.register Year do
  permit_params :year, :square_cost, :source_url, :winner_digits, :loser_digits

  config.sort_order = 'year_dsc'

  form do |f|
    f.inputs :year, :square_cost, :source_url, :winner_digits, :loser_digits
    f.actions
  end
  
  index do
    column :year, sortable: :year do |y|
      div class: 'year' do
        y.year
      end
    end
    column :square_cost
    column :square_cost, sortable: :square_cost do |y|
      number_to_currency y.square_cost
    end
    column :source_url
    column :winner_digits
    column :loser_digits
    actions
  end
end
