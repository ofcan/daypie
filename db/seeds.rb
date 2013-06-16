user_1 = User.create( username: 'ofca',
                      email: 'sven.dupli@gmail.com',
                      password: 'supersecret')
user_2 = User.create( username: 'superman',
                      email: 'superman@example.com',
                      password: 'supersecret')

pie_1 = Pie.create( name: 'Blueberry pie',
                    description: 'Blueberry pie is a sweet pie filled with blueberries.')
pie_2 = Pie.create( name: 'Raspberry Pi',
                    description: 'A credit-card-sized single-board computer developed in the UK.')
pie_3 = Pie.create( name: 'Daft pie',
                    description: 'A pie that makes you harder, better, faster, stronger.')
pie_4 = Pie.create( name: 'Number Pi',
                    description: "Ratio of a circle's circumference to its diameter.")
user_1.pies << pie_1
user_2.pies << pie_2
user_2.pies << pie_3
user_2.pies << pie_4

activity_1 = Activity.create( title: 'Get the ingridients',
                              description: 'Local store probably',
                              from_time: Time.now + 3600,
                              until_time: Time.now + 7200 )
pie_1.activities << activity_1
