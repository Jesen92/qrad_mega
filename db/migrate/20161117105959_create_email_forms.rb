class CreateEmailForms < ActiveRecord::Migration
  def change
    create_table :email_forms do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
