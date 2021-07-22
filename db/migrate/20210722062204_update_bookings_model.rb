class UpdateBookingsModel < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :number_of_people, :integer
    add_column :bookings, :owner_response, :boolean, :default => false
  end
end
