
# only one function is required
# Your parameters 
# $1 = home dir for user that will run test
# $2 = user, this is user[NUMBER] 
function _plugin_install() {

	userHome=$1
  
  # Functions you can use to find other services
  # $(plugin_getJMeterHome) - Gets path to jmeter version to be used.
	jmeterHome=$(plugin_getJMeterHome)

  # other calls
  # plugin_getJMeterVersion
  # plugin_getGatlingHome
  # plugin_getGatlingVersion
  # plugin_setting "NAME"  <- This will get config bundled in load test package.
  # ## plugin_setting serverCount <- how many servers used for this test run
  # ## plugin_setting testName <- test name set in UI

  # Not useful, but an example
  sudo echo "Hello World"
  
  # Change /etc/hosts
  echo "127.0.0.1 my-load-agent" | sudo tee -a /etc/hosts

}


