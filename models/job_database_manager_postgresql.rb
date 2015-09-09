require 'jenkins_plugin_base'
require 'job_database_manager'

require_relative 'job_database_manager_postgresql_descriptor'
require_relative 'postgresql_adapter'

#
# This is the main entry point for Jenkins plugins.
#

class JobDatabaseManagerPostgresql < Jenkins::Model::RootAction
  #
  # This should be available for all plugins.
  # It adds the 2 methods below : *set_plugin_name* and *set_plugin_settings*
  #
  include ::JenkinsPluginBase::BasePlugin

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


#
# Register our new class in Jenkins plugins
#
Jenkins::Plugin.instance.register_extension(JobDatabaseManagerPostgresql)


#
# Trigger accessors creation for our plugin.
# This must happen AFTER *register_extension* call otherwhise got :
# uninitialized constant #<Class:0x2d474d30>::JobDatabaseManagerPostgresql (NameError)
# Kind of chicken/egg issue.
#
# This trick allows plugin settings declaration to sit here instead of JobDatabaseManagerPostgresqlDescriptor.
# Settings are automatically retrieve from the Hash above and for each an accessor is created.
# They are are automatically saved and retrieved from XML file with default value handling.
#
JobDatabaseManagerPostgresqlDescriptor.create_settings_accessors!
