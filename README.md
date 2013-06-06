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
curl -XGET -d'guest_id=2'  http://localhost:3000/api/likes

{"likes":[{"created_at":"2013-06-06T11:07:48Z","guest_id":2,"id":3,"medium_id":1,"updated_at":"2013-06-06T11:07:48Z","user_id":null},{"created_at":"2013-06-06T11:13:42Z","guest_id":2,"id":4,"medium_id":1,"updated_at":"2013-06-06T11:13:42Z","user_id":null}]}

 curl -XPOST -d'like[medium_id]=1&like[guest_id]=2' http://localhost:3000/api/likes

 {"like":{"created_at":"2013-06-06T11:07:48Z","guest_id":2,"id":3,"medium_id":1,"updated_at":"2013-06-06T11:07:48Z","user_id":null}}


 curl -XDELETE  http://localhost:3000/api/likes/2

 {"success":true}
</code>
