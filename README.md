# README
```
1. Create Mysql Databse in local env (rails db:create)
2. Change databse credentials in config/databse.yml file as below
      adapter: mysql2
      encoding: utf8mb4
      pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
      username: root
      password: 
      host: localhost
      
      development:
      <<: *default
        database: translator_api_development
3. Run bundler install
4. Run migration command 
   rails db:migrate
5. Start server 
   rails s or rails server
```
