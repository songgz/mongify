require File.join(File.dirname(File.dirname(File.dirname(File.expand_path(__FILE__)))), 'spec_helper')
require File.join(File.dirname(File.dirname(File.dirname(File.dirname(File.expand_path(__FILE__))))), 'lib', 'mongify', 'database', 'sql_config')

describe Mongify::Database::SqlConfig do
  before(:each) do
    @adaptor = 'mysql'
    @host = '127.0.0.1'
    @database = 'test_database'
    @sql_config = Mongify::Database::SqlConfig.new
  end
  
  context "valid?" do
    it "should be true" do
      Mongify::Database::SqlConfig.new(:adaptor => 'mysql', :host => 'localhost', :database => 'blue').should be_valid
    end
    it "should be false" do
      Mongify::Database::SqlConfig.new.should_not be_valid
    end
  end
  
  context "connection string" do
    before(:each) do
      @sql_config.adaptor(@adaptor)
      @sql_config.host(@host)
      @sql_config.database(@database)
    end
    
    it "should have a connection string without username and password" do
      @sql_config.connection_string.should == "#{@adaptor}://#{@host}/#{@database}"
    end
    
    it "should have a connection string without username and password" do
      @sql_config.username('bob')
      @sql_config.password('secret')
      @sql_config.connection_string.should == "#{@adaptor}://bob:secret@#{@host}/#{@database}"
    end
    
    it "should check connection" do
      @sql_config.connects?
    end
  end
  
  

  
  
  
end

