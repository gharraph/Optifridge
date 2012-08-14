module ItemKindsHelper
	def list_storage(types)
		select_compiled = []
		types.each do |storage_type|
			select_compiled << [storage_type, storage_type]
		end
		select_compiled
	end
end
