module ScormCloud
	class CLI
		def self.start
			command = ARGV.shift
			appid = ENV['SCORM-CLOUD-APPID']
			secret = ENV['SCORM-CLOUD-SECRET']
      ssl = ENV['SCORM-CLOUD-SSL']
			opts = {}
			while ARGV.length > 0
				case ARGV[0]
    			when '--appid'
	    			ARGV.shift; appid = ARGV.shift
	    		when '--secret'
	    			ARGV.shift; secret = ARGV.shift
          when '--ssl'
            ARGV.shift; ssl = ARGV.shift
	    		else
	    			name = ARGV.shift[2..-1].to_sym
	    			value = ARGV.shift
	    			opts[name] = value
    			end
    		end
    		sc = ScormCloud.new(appid, secret, ssl)
    		puts sc.call(command, opts)
		end
	end
end