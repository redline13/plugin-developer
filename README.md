Writing Custom Dev Plugins for Agent Set Up

# Write custom plugin.
- It's a bash script
- Implement "function _plugin_install()"
- Here is an example
- Source Example : [Agent Plugin (Gist)](https://gist.github.com/richardfriedman/e706cdca880a8698228422c89b0b254e)

```
# You only one function is required
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
  echo "Hello World"
  
  # Change /ets/hosts, you can use sudo - its your load agent
  echo "127.0.0.1 my-load-agent" | sudo tee -a /etc/hosts
}
```

# Enable custom plugins
- Go to account plugins https://www.redline13.com/Account/plugins
- Make sure your account has the custom dev plugins added
![PluginManager](https://d1u7j79bg1ays7.cloudfront.net/blog/wp-content/uploads/2020/11/PluginManager.png)

# Using Plugin For Test
- You need a public link to the file, we use raw github links
-- The plugin above has 
--- Gist URL: https://gist.github.com/richardfriedman/e706cdca880a8698228422c89b0b254e
--- Raw URL: https://gist.githubusercontent.com/richardfriedman/e706cdca880a8698228422c89b0b254e/raw/fbf5bb8ff6b69525289a057868104c4f75887197/agent.sh
-- We need the 'Raw' url.

- In your JMeter test go to Advanced JMeter Options -> Plugins
-- Enable 'JMeter Dev'
-- Paste in public URL (Raw gist from above)
-- ![AgentPluginJMeter](https://d1u7j79bg1ays7.cloudfront.net/blog/wp-content/uploads/2020/11/AgentPluginJMeter.png)

# Now run your test as usual.
