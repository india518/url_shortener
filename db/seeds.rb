# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

long1 = LongUrl.create([{name: 'https://github.com/appacademy/sql-curriculum/blob/master/active-record/migrations.md'}])
short1 = ShortUrl.create([{name: SecureRandom.urlsafe_base64}, {user_id: 1}, {long_url_id: 1}])
comment1 = Comment.create([{user_id: 1}, {short_url_id: 1}, {body: "hello!"}])
user1 = User.create([{username: "MarthaStewart", email: "ms@ms.com"}])
stat1 = Stat.create([{user_id: 1, short_url_id: 1}])
tag1 = Tag.create([{short_url_id: 1}, {user_id: 1}, {tag_type_id: 2}])

tag_type1 = TagType.create([{type_of_tag: "sports"}])
tag_type2 = TagType.create([{type_of_tag: "news"}])
tag_type3 = TagType.create([{type_of_tag: "tv"}])