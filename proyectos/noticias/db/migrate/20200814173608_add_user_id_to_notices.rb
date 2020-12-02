class AddUserIdToNotices < ActiveRecord::Migration[6.0]
  def change
    add_reference :notices, :user, null: false, foreign_key: true, default: User.where(admin: true).first.id
  end
end
