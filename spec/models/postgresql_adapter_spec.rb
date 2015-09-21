require 'spec_helper'

describe JobDatabaseManagerPostgresql::PostgresqlAdapter do

  let(:klass) { build_adapter }

  subject { klass }

  describe '#create_database_query' do
    it 'should return a SQL statement to create database' do
      expect(klass.create_database_query('foo')).to eq 'CREATE DATABASE foo;'
    end
  end


  describe '#create_user_query' do
    it 'should return a SQL statement to create user' do
      expect(klass.create_user_query('database', 'user', 'password')).to eq "CREATE USER user WITH PASSWORD 'password';"
    end
  end


  describe '#create_privileges_query' do
    it 'should return a SQL statement to create privileges for user' do
      expect(klass.create_privileges_query('database', 'user', 'password')).to eq "GRANT ALL PRIVILEGES ON DATABASE database TO user;"
    end
  end


  describe '#drop_database_query' do
    it 'should return a SQL statement to drop database' do
      expect(klass.drop_database_query('database')).to eq 'DROP DATABASE IF EXISTS database;'
    end
  end


  describe '#drop_privileges_query' do
    it 'should return a SQL statement to drop privileges' do
      expect(klass.drop_privileges_query('user')).to be nil
    end
  end


  describe '#drop_user_query' do
    it 'should return a SQL statement to drop user' do
      expect(klass.drop_user_query('user')).to eq "DROP USER user;"
    end
  end


  describe '#db_user' do
    it 'should return command params to create user' do
      expect(klass.db_user).to eq ['--username', 'foo']
    end
  end


  describe '#db_name' do
    it 'should return command params to create database' do
      expect(klass.db_name).to eq ['--dbname', 'postgres']
    end
  end


  describe '#env_vars' do
    it 'should return a hash of environment variables' do
      expect(klass.env_vars).to eq({'PGPASSWORD' => 'pass'})
    end
  end


  describe '#query_cmd' do
    it 'should return a SQL statement to create database' do
      expect(klass.query_cmd('foo')).to eq ['/usr/bin/psql', '--host', '127.0.0.1', '--port', 5432, '--username', 'foo', '--dbname', 'postgres', '--command', 'foo']
    end
  end


  describe '#execute_query_cmd' do
    it 'should return a SQL statement to create database' do
      expect(klass.execute_query_cmd).to eq '--command'
    end
  end

end
