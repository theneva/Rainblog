# Decided to go with SecurePassword
class RenamePasswordHashToPasswordDigest < ActiveRecord::Migration
	def change
		rename_column :users, :password_hash, :password_digest
	end
end
