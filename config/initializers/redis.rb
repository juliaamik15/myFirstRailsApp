if Rails.env.production?
	$redis = Redis.new(:host => 'cacti-from-julia.herokuapp.com', :port => 6379)	
else
	$redis = Redis.new(:host => 'localhost', :port => 6379)
end