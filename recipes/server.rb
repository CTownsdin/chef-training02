package 'httpd' do
  action :install
end

file '/var/www/html/index.html' do
  content 
  "<h1>Hello, world!</h1>
  <h2>ipaddress: #{node['ipaddress']}</h2>
  <h2>hostname: #{node['hostname']}</h2>
  <h3>hostname: #{node['fqdn']}</h3>
  <p>recipes: #{node['recipes']}</p>
  "
  mode '0644'
  #action :create # is implied, not necessary
end

service "httpd" do
  action [ :enable, :start ]
end

