# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

long1 = LongUrl.create([{name: 'https://github.com/appacademy/sql-curriculum/blob/master/active-record/migrations.md'}])
long2 = LongUrl.create([{name: 'http://www.google.com/'}])
long3 = LongUrl.create([{name: 'www.yahoo.com'}])
long4 = LongUrl.create([{name: 'appacademy.io'}])

short1 = ShortUrl.create([{name: SecureRandom.urlsafe_base64, user_id: 1, long_url_id: 4}])
short2 = ShortUrl.create([{name: SecureRandom.urlsafe_base64, user_id: 2, long_url_id: 3}])
short3 = ShortUrl.create([{name: SecureRandom.urlsafe_base64, user_id: 3, long_url_id: 2}])
short4 = ShortUrl.create([{name: SecureRandom.urlsafe_base64, user_id: 4, long_url_id: 1}])
short5 = ShortUrl.create([{name: SecureRandom.urlsafe_base64, user_id: 3, long_url_id: 4}])
short6 = ShortUrl.create([{name: SecureRandom.urlsafe_base64, user_id: 4, long_url_id: 4}])

comment1 = Comment.create([{user_id: 1, short_url_id: 1, body: "hello!"}])
comment2 = Comment.create([{user_id: 1, short_url_id: 2, body: "goodbye!"}])
comment3 = Comment.create([{user_id: 2, short_url_id: 3, body: "!!!!"}])
comment4 = Comment.create([{user_id: 4, short_url_id: 5, body: "h==ad;lfjads;!"}])

user1 = User.create([{username: "MarthaStewart", email: "ms@ms.com"}])
user2 = User.create([{username: "Craig", email: "dfkjdfkdjk@a.com"}])
user3 = User.create([{username: "Betty", email: "bldfakj@df.com"}])
user4 = User.create([{username: "Block", email: "proc.cd"}])

stat1 = Stat.create([{user_id: 1, short_url_id: 1}])
stat2 = Stat.create([{user_id: 2, short_url_id: 2}])
stat3 = Stat.create([{user_id: 3, short_url_id: 4}])
stat4 = Stat.create([{user_id: 3, short_url_id: 5}])
stat5 = Stat.create([{user_id: 4, short_url_id: 5}])
stat6 = Stat.create([{user_id: 5, short_url_id: 3}])
stat7 = Stat.create([{user_id: 3, short_url_id: 2}])

tag1 = Tag.create([{short_url_id: 1, user_id: 1, tag_type_id: 1}])
tag2 = Tag.create([{short_url_id: 2, user_id: 2, tag_type_id: 2}])
tag3 = Tag.create([{short_url_id: 2, user_id: 3, tag_type_id: 3}])
tag4 = Tag.create([{short_url_id: 3, user_id: 4, tag_type_id: 2}])
tag5 = Tag.create([{short_url_id: 5, user_id: 2, tag_type_id: 1}])

tag_type1 = TagType.create([{type_of_tag: "sports"}])
tag_type2 = TagType.create([{type_of_tag: "news"}])
tag_type3 = TagType.create([{type_of_tag: "tv"}])