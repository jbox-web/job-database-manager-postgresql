require 'job_database_manager'

class JobDatabaseManagerPostgresql < Jenkins::Model::RootAction
  class PostgresqlAdapter < ::JobDatabaseManager::DbAdapter::AbstractAdapter

    def create_database_query(database)
      "CREATE DATABASE #{database};"
    end


    def create_user_query(database, user, password)
      "CREATE USER #{user} WITH PASSWORD '#{password}';"
    end


    def create_privileges_query(database, user, password)
      "GRANT ALL PRIVILEGES ON DATABASE #{database} TO #{user};"
    end


    def drop_database_query(database)
      "DROP DATABASE IF EXISTS #{database};"
    end


    def drop_privileges_query(user)
      nil
    end


    def drop_user_query(user)
      "DROP USER #{user};"
    end


    def db_user
      ['--username', user]
    end


    def env_vars
      { 'PGPASSWORD' => password }
    end


    def execute_query_cmd
      '--command'
    end


    def db_name
      ['--dbname', 'postgres']
    end


    def query_cmd(sql)
      [db_cmd, *db_host, *db_port, *db_user, *db_name, *db_query(sql)]
    end

  end
end
