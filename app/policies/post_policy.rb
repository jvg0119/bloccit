class PostPolicy < ApplicationPolicy
	
	def index?
		true
	end

	class Scope < Scope
		attr_reader :user, :scope

		def initialize(user, scope)
	    	@user = user
	    	@scope = scope
		end

		def resolve
	    	if user.admin? || user.moderator?
	        	scope.where(user: user)
	        	#scope.all
	    	else
	        	#scope.where(user: user)
	        	#scope.where(account_id: user.account_id)
	     	end
		end
	end
end
