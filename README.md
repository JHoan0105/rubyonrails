# README
https://guides.rubyonrails.org/action_view_overview.html


* Database creation
to show database tables
ActiveRecord::Base.connection.tables
ActiveRecord::Base.connection.columns('projects').map(&:name)


ActiveRecord::Base.connection.columns("foos") # to show column

ActiveRecord::Base.connection.columns("foos").map{|c| [c.name, c.type] } 

ActiveRecord::Base.subclasses.map { |cl| cl.name }
ActiveRecord::Base.subclasses.find { |cl| cl.name == "Foo" }

In development need Rails.application.eager_load! before.
ActiveRecord::Base.descendants.map(&:name)

rails dbconsole
rails db
\l Lists available databases
\d Lists tables available in the current database
\? (help) lists the many options for examining other sorts of objects

pretty print your query output
.headers on
.mode columns
(turn headers on and show database data in column mode )
Show the tables

.table
'.help' to see help.
Or use SQL statements like 'Select * from cars'

* How to run the test suite
bin/rails test <filename or exclude to run all>
bin/rubocop // to show inconcistencies
bin/rubocop -a // autocorrect
bin/brakman // security test


* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
// kamal - uses docker

* ...
