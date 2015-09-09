module Publishers
  class DestroyPostgresqlDatabase < Jenkins::Tasks::Publisher
    display_name 'Drop a PostgreSQL database after the job finished'
    include ::JobDatabaseManager::DbDestroyer

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
