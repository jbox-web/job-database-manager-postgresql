# This is the main Descriptor for your plugin.
# It handles plugin's global configuration.
# It must respond to these methods :
#  * load
#  * save
#  * configure

require 'jenkins_plugin_base'
require 'job_database_manager'

class JobDatabaseManagerPostgresqlDescriptor < Jenkins::Model::DefaultDescriptor

  #
  # Include PluginConfig::Base module to add the basic methods.
  #
  include ::JenkinsPluginBase::BaseConfig

  #
  # Declare your plugin name here. (Will be use in XML file)
  #
  set_plugin_name 'job-database-manager-postgresql'

  #
  # Declare your global plugin settings here :
  # <param name> => <default_value>
  #
  set_plugin_settings({
    :db_user         => 'jenkins',
    :db_password     => 'jenkins',
    :db_server_host  => '127.0.0.1',
    :db_server_port  => '5432',
    :db_bin_path     => '/usr/bin/psql'
  })

end
