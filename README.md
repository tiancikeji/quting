quting
======

quting

<h4>Media</h4>
<code>

http://t.pamakids.com/api/media?page=1


curl -XGET  -d'term=dd' http://localhost:3000/api/media?page=1

{"count":129,"media":[]}
</code>

<h4>MP3 files</h4>
<code>

http://t.pamakids.com/api/mfiles?medium_id=1
</code>

<h4>Guest Registration</h4>

<code>
curl -XPOST -d'guest[device_token]=1111' http://localhost:3000/api/guests

{"guest":{"created_at":"2013-06-06T11:01:14Z","device_token":"1111","id":2,"updated_at":"2013-06-06T11:01:14Z"}}
</code

<h4>Like</h4>

<code>

curl -XGET -d'guest_id=2' http://localhost:3000/api/likes

{"likes":[{"author":"浙江电子","category":"少儿读物","created_at":"2013-05-21T16:46:04Z","description":"作品简介： 天籁般的童声，首首短小精悍、曲曲沁人心田，把你带回到无限美好的童年时代，徜徉于阳光哺育的孩提时光。带走成长的烦恼、摆脱世俗的扰忧。","id":1,"jishu":"总集数：48","mtype":"http://www.huaxiazi.com/ProductImages/2012331155107.jpg","name":"经典少儿歌曲（一）","time":null,"updated_at":"2013-05-21T16:46:04Z","updatetime":"2012-03-31","url":"http://www.huaxiazi.com/Productinfo.aspx?id=35572","yanbo":"浙江电子音像出版社"}]}

 curl -XPOST -d'like[medium_id]=1&like[guest_id]=2' http://localhost:3000/api/likes

 {"like":{"created_at":"2013-06-06T11:07:48Z","guest_id":2,"id":3,"medium_id":1,"updated_at":"2013-06-06T11:07:48Z","user_id":null}}


 curl -XDELETE  http://localhost:3000/api/likes/2

 {"success":true}
</code>

<h4> buy</h4>
<code>
curl -XPOST -d'buy[guest_id]=2&buy[medium_id]=1' http://localhost:3000/api/buys

{"buy":{"created_at":"2013-06-09T15:08:45Z","guest_id":2,"id":2,"medium_id":1,"updated_at":"2013-06-09T15:08:45Z"}}


curl -XGET -d'guest_id=2' http://localhost:3000/api/buys

{"buys":[{"author":"浙江电子","category":"少儿读物","created_at":"2013-05-21T16:46:04Z","description":"作品简介： 天籁般的童声，首首短小精悍、曲曲沁人心田，把你带回到无限美好的童年时代，徜徉于阳光哺育的孩提时光。带走成长的烦恼、摆脱世俗的扰忧。","id":1,"jishu":"总集数：48","mtype":"http://www.huaxiazi.com/ProductImages/2012331155107.jpg","name":"经典少儿歌曲（一）","time":null,"updated_at":"2013-05-21T16:46:04Z","updatetime":"2012-03-31","url":"http://www.huaxiazi.com/Productinfo.aspx?id=35572","yanbo":"浙江电子音像出版社"}]}

cancel buy 

curl -XDELETE -d'guest_id=1&medium_id=1' http://localhost:3000/api/buys/1

{"success":true}

</code>


<h4>Category</h4>
<code>
curl -XGET http://localhost:3001/api/categories

{"categories":[{"created_at":"2013-06-20T05:59:55Z","id":1,"name":"111","updated_at":"2013-06-20T05:59:55Z"}]}
</code>
