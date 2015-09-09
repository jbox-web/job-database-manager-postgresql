module Builders
  class CreatePostgresqlDatabase < Jenkins::Tasks::BuildWrapper
    display_name 'Create a PostgreSQL database for the job'
    include ::JobDatabaseManager::DbCreator

    def get_setting_value_for(setting)
      JobDatabaseManagerPostgresql.get_setting_value_for(setting)
    end


    def db_adapter_klass
      'JobDatabaseManagerPostgresql::PostgresqlAdapter'
    end


    def db_adapter_name
      'PostgreSQL'
    end


    def db_adapter_type
      :pgsql
    end

  end
end
