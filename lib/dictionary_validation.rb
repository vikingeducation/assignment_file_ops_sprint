class DictionaryValidation < Mousevc::Validation
	def initialize(options={})
		@model = options[:model]
	end

	def valid_dictionary?(value)
		is_valid_dictionary = coerce_bool (integer?(value) && @model.loader.files[value.to_i - 1])
		unless is_valid_dictionary
			@error = "Error, expected a valid dictionary file, got: #{value}"
		end
		is_valid_dictionary
	end

	def valid_search?(value)
		is_valid_search = coerce_bool (value =~ /^[1-4]{1} [a-zA-Z]+$/)
		unless is_valid_search
			@error = "Error, expected a valid search type, got: #{value}"
		end
		is_valid_search
	end

	def valid_yes_or_no?(value)
		is_valid_yes_no = coerce_bool (['y', 'yes', 'n', 'no'].include?(value))
		unless is_valid_yes_no
			@error = "Error, expected 'y', 'yes', 'n', 'no', got: #{value}"
		end
		is_valid_yes_no
	end

	def valid_filename?(value)
		is_valid_filename = coerce_bool (value =~ /^[a-zA-Z\.\-_]+$/)
		unless is_valid_filename
			@error = "Error, expected a filename with only letters, dots, dashes or underscores, got: #{value}"
		end
		is_valid_filename
	end

	def allow_overwrite?(value)
		words = value.split(' ')
		coerce_bool (words.first =~ /^overwrite$/)
	end

	def yes?(value)
		coerce_bool (['y', 'yes'].include?(value))
	end

	def no?(value)
		coerce_bool (['n', 'no'].include?(value))
	end

	def overwrite?
		will_overwrite = @model.saver.overwrite?
		if will_overwrite
			@error = "Error, file already exists with name: #{@model.saver.filename}\nForce overwrite by typing 'overwrite' before the filename"
		end
		will_overwrite
	end
end