require 'spec_helper'

describe Publishers::DestroyPostgresqlDatabase do

  let(:klass) { build_db_destroyer }

  subject { klass }

  it { expect(klass.db_adapter_name).to eq 'PostgreSQL' }
  it { expect(klass.db_adapter_type).to eq :pgsql }
  it { expect(klass.db_adapter_klass).to eq 'JobDatabaseManagerPostgresql::PostgresqlAdapter' }

  describe '#get_setting_value_for' do
    it 'should return value of setting' do
      expect(JobDatabaseManagerPostgresql).to receive(:get_setting_value_for).with('foo')
      klass.get_setting_value_for('foo')
    end
  end

end
