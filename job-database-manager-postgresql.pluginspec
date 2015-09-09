Jenkins::Plugin::Specification.new do |plugin|
  plugin.name         = 'job-database-manager-postgresql'
  plugin.display_name = 'Job Database Manager for PostgreSQL'
  plugin.version      = '1.0.0'
  plugin.description  = 'Automatically create and delete a PostgreSQL database for a job.'
  plugin.url          = 'http://jbox-web.github.io/job-database-manager-postgresql/'

  plugin.developed_by 'Tim Fischbach', 'tfischbach@codevise.de'
  plugin.developed_by 'Nicolas Rodriguez', 'nrodriguez@jbox-web.com'
  plugin.developed_by 'Leandro Muniz de Lima', 'leandro.m.lima@ufes.br'

  plugin.uses_repository :git => 'https://github.com/jbox-web/job-database-manager-postgresql.git'

  plugin.depends_on 'ruby-runtime', '0.12'
end
