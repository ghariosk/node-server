# # encoding: utf-8

# Inspec test for recipe node-server::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

#This is an exmaple test, replace it with your won test/
describe package 'nginx' do
	it {should be_installed}
	 #will turn on and off when turning maching on and off
end

describe service 'nginx' do 
	it {should be_running}
	it {should be_enabled}
end


# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

describe package 'nodejs' do
	it { should be_installed}
end



# better 

describe npm('pm2') do
	it {should be_installed}
end
