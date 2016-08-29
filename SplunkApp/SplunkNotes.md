# splunk Apps and add-ons
## apps vs add-ons
both are packged set of configuration that installed on Splunk Enterprise.
no definitive criteria about the difference, but normally:

- app comes with GUI but add-on not

## develop a splunk app
- splunk home, click "gear" icon next to "Apps", click "create app", fill details where only Folder name is required.
- save, folder should created under $splunk_home/etc/apps

### add the app icon
it's under $splunk_home/etc/apps/yourapp/static
- main icon
  - $SPLUNK_HOME/etc/apps/<app_name>/static/appIcon.png 36x36px
  - $SPLUNK_HOME/etc/apps/<app_name>/static/appIcon_2x.png 72x72px
- menu icon
  - $SPLUNK_HOME/etc/apps/<app_name>/static/appIconAlt.png 36x36px
  - $SPLUNK_HOME/etc/apps/<app_name>/static/appIconAlt_2x.png 72x72px


## work with the HTML Dashboard
the out of box Dashboard editing is easy to work with, but you may need to consider HTML dashboard if you want to deep customization.

## about the SplunkJS stack
- **backbone.js** as the MVC framework
- **RequireJS** manage dependecies
- **jQuery** makes DOM handling easier



## reference
- [splunk official documentation](https://docs.splunk.com/Documentation/Splunk/6.4.2/Admin/Whatsanapp)
- [create an app](http://dev.splunk.com/view/webframework-developapps/SP-CAAAEUC)
- [splunk dashboard examples](https://splunkbase.splunk.com/app/1603/)
  - download, install from file, choose file, restart splunk
